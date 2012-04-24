require 'active_support'
require 'feedzirra'

class Feeds
  include Cinch::Plugin

  def initialize(*args)
    super
    load_feeds!
  end

  def load_feeds!
    @@feeds = {}
    @@timers = {}
    config.keys.each do |feed|
      add_feed!(feed)
    end
  end

  def add_feed!(feed)
    options = config[feed]
     if options[:interval] && options[:channels]
       @@feeds[feed] = Feedzirra::Feed.fetch_and_parse feed.to_s
       @@timers[feed] = Timer(options[:interval]) { check_feed(feed, options[:channels]) }
     end
  end

  def remove_feed!(feed)
    @@timers[feed].stop if @@timers.has_key?(feed)
  end

  def update_feed!(feed)
    remove_feed!(feed)
    add_feed!(feed)
  end

  def reload_feeds!
    @@timers.each {|feed,timer| timer.stop }
    load_feeds!
  end

  def check_feed(feed, channels)
    channels = channels.map { |channel|
      Channel(channel) if bot.channels.include?(channel)
    }.compact
   
    return if channels.empty?
    
    synchronize(:feeds) do
      updated = Feedzirra::Feed.update @@feeds[feed]
      @@feeds[feed].update_from_feed updated unless updated.is_a?(Array)
      new_entries = @@feeds[feed].new_entries
      updated.new_entries = []
      @@feeds[feed] = updated
     
      new_entries.each do |entry|
        channels.each do |channel|
          author = "<#{entry.author}>" unless entry.author.strip.empty?
          channel.send "[feed] #{author} #{entry.title} - #{entry.url}".gsub("\n", "")
        end
      end
    end
  end

  set(plugin_name: "feeds",
      help: "Usage: !listfeeds, !addfeed url [interval in seconds=300], !setinterval url interval in seconds, !rmfeed url")

  match /listfeeds/, method: :list_feeds
  def list_feeds(m)
    if get_feeds_for_channel(m.channel.name).any?
      get_feeds_for_channel(m.channel.name).each do |feed, options|
        m.reply "#{feed} checked every #{options[:interval]} seconds"
      end
    else
      m.reply "No feeds found for this channel."
    end
  end

  match /addfeed\s+(http\S+)\s*$/, method: :add_feed
  match /addfeed\s+(http\S+)\s+(\d+)/, method: :add_feed
  def add_feed(m, url, interval=300)
    url = url.to_sym
    if has_feed?(url, m.channel.name)
      m.reply "#{url} is already registered, checked every #{config[url][:interval]} seconds"
    else
      synchronize(:settings) do
        settings.feeds[url] ||= {}
        settings.feeds[url][:channels] ||= []
        settings.feeds[url][:channels] << m.channel.name
        settings.feeds[url][:interval] = interval
        settings.save!
        config[url] = settings.feeds[url]
        add_feed!(url)
      end
      m.reply "#{url} added, checked every #{interval} seconds"
    end
  end

  match /setinterval\s+(http\S+) (\d+)/, method: :set_interval
  def set_interval(m, url, interval)
    url = url.to_sym
    if has_feed?(url, m.channel.name)
      synchronize(:settings) do
        settings.feeds[url][:interval] = interval
        settings.save!
        config[url] = settings.feeds[url]
        update_feed!(url)
      end
      m.reply "#{url} is now checked every #{interval} seconds"
    else
      m.reply "#{url} is not registered for this channel"
    end
  end

  match /rmfeed\s+(http\S+)/, method: :rm_feed
  def rm_feed(m, url)
    url = url.to_sym
    if has_feed?(url, m.channel.name)
      synchronize(:settings) do
        settings.feeds[url][:channels].delete m.channel.name
        if settings.feeds[url][:channels].any?
          config[url] = settings.feeds[url]
        else
          settings.feeds.delete(url)
          config[url].delete(url) if config[url] #TODO investigate
        end
        settings.save!
        remove_feed!(url)
      end
      m.reply "#{url} removed"
    else
      m.reply "#{url} is not registered for this channel"
    end
  end

  private
  def has_feed?(url, channel)
    get_feeds_for_channel(channel).keys.include?(url.to_sym)
  end

  def get_feeds_for_channel(channel)
    config.select {|k, v| v[:channels].include?(channel) }
  end
end


     
