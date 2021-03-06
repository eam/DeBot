module IRC
  class Message
    PASS     = "PASS"
    NICK     = "NICK"
    USER     = "USER"
    OPER     = "OPER"
    MODE     = "MODE"
    SERVICE  = "SERVICE"
    QUIT     = "QUIT"
    SQUIT    = "SQUIT"
    JOIN     = "JOIN"
    PART     = "PART"
    TOPIC    = "TOPIC"
    NAMES    = "NAMES"
    LIST     = "LIST"
    INVITE   = "INVITE"
    KICK     = "KICK"
    PRIVMSG  = "PRIVMSG"
    NOTICE   = "NOTICE"
    MOTD     = "MOTD"
    LUSERS   = "LUSERS"
    VERSION  = "VERSION"
    STATS    = "STATS"
    LINKS    = "LINKS"
    TIME     = "TIME"
    CONNECT  = "CONNECT"
    TRACE    = "TRACE"
    ADMIN    = "ADMIN"
    INFO     = "INFO"
    SERVLIST = "SERVLIST"
    SQUERY   = "SQUERY"
    WHO      = "WHO"
    WHOIS    = "WHOIS"
    WHOWAS   = "WHOWAS"
    KILL     = "KILL"
    PING     = "PING"
    PONG     = "PONG"
    ERROR    = "ERROR"
    AWAY     = "AWAY"
    REHASH   = "REHASH"
    DIE      = "DIE"
    RESTART  = "RESTART"
    SUMMON   = "SUMMON"
    USERS    = "USERS"
    WALLOPS  = "WALLOPS"
    USERHOST = "USERHOST"
    ISON     = "ISON"

    CAP              = "CAP"

    AUTHENTICATE     = "AUTHENTICATE"
    RPL_LOGGEDIN     = "900"
    RPL_LOGGEDOUT    = "901"
    ERR_NICKLOCKED   = "902"
    RPL_SASLSUCCESS  = "903"
    ERR_SASLFAIL     = "904"
    ERR_SASLTOOLONG  = "905"
    RPL_SASL_ABORTED = "906"
    ERR_SASLALREADY  = "907"
    RPL_SASLMECHS    = "908"

    ACCOUNT          = "ACCOUNT"
    RPL_WHOISACCOUNT = "330"

    RPL_BOUNCE = "005" # According to RFC
    ISUPPORT   = "005" # In practice

    RPL_WELCOME           = "001"
    RPL_YOURHOST          = "002"
    RPL_CREATED           = "003"
    RPL_MYINFO            = "004"
    RPL_USERHOST          = "302"
    RPL_ISON              = "303"
    RPL_AWAY              = "301"
    RPL_UNAWAY            = "305"
    RPL_NOWAWAY           = "306"
    RPL_WHOISUSER         = "311"
    RPL_WHOISSERVER       = "312"
    RPL_WHOISOPERATOR     = "313"
    RPL_WHOISIDLE         = "317"
    RPL_ENDOFWHOIS        = "318"
    RPL_WHOISCHANNELS     = "319"
    RPL_WHOWASUSER        = "314"
    RPL_ENDOFWHOWAS       = "369"
    RPL_LISTSTART         = "321"
    RPL_LIST              = "322"
    RPL_LISTEND           = "323"
    RPL_UNIQOPIS          = "325"
    RPL_CHANNELMODEIS     = "324"
    RPL_NOTOPIC           = "331"
    RPL_TOPIC             = "332"
    RPL_INVITING          = "341"
    RPL_SUMMONING         = "342"
    RPL_INVITELIST        = "346"
    RPL_ENDOFINVITELIST   = "347"
    RPL_EXCEPTLIST        = "348"
    RPL_ENDOFEXCEPTLIST   = "349"
    RPL_VERSION           = "351"
    RPL_WHOREPLY          = "352"
    RPL_ENDOFWHO          = "315"
    RPL_NAMREPLY          = "353"
    RPL_ENDOFNAMES        = "366"
    RPL_LINKS             = "364"
    RPL_ENDOFLINKS        = "365"
    RPL_BANLIST           = "367"
    RPL_ENDOFBANLIST      = "368"
    RPL_INFO              = "371"
    RPL_ENDOFINFO         = "374"
    RPL_MOTDSTART         = "375"
    RPL_MOTD              = "372"
    RPL_ENDOFMOTD         = "376"
    RPL_YOUREOPER         = "381"
    RPL_REHASHING         = "382"
    RPL_YOURESERVICE      = "383"
    RPL_TIME              = "391"
    RPL_USERSSTART        = "392"
    RPL_USERS             = "393"
    RPL_ENDOFUSERS        = "394"
    RPL_NOUSERS           = "395"
    RPL_TRACELINK         = "200"
    RPL_TRACECONNECTING   = "201"
    RPL_TRACEHANDSHAKE    = "202"
    RPL_TRACEUNKNOWN      = "203"
    RPL_TRACEOPERATOR     = "204"
    RPL_TRACEUSER         = "205"
    RPL_TRACESERVER       = "206"
    RPL_TRACESERVICE      = "207"
    RPL_TRACENEWTYPE      = "208"
    RPL_TRACECLASS        = "209"
    RPL_TRACERECONNECT    = "210"
    RPL_TRACELOG          = "261"
    RPL_TRACEEND          = "262"
    RPL_STATSLINKINFO     = "211"
    RPL_STATSCOMMANDS     = "212"
    RPL_ENDOFSTATS        = "219"
    RPL_STATSUPTIME       = "242"
    RPL_STATSOLINE        = "243"
    RPL_UMODEIS           = "221"
    RPL_SERVLIST          = "234"
    RPL_SERVLISTEND       = "235"
    RPL_LUSERCLIENT       = "251"
    RPL_LUSEROP           = "252"
    RPL_LUSERUNKNOWN      = "253"
    RPL_LUSERCHANNELS     = "254"
    RPL_LUSERME           = "255"
    RPL_ADMINME           = "256"
    RPL_ADMINLOC1         = "257"
    RPL_ADMINLOC2         = "258"
    RPL_ADMINEMAIL        = "259"
    RPL_TRYAGAIN          = "263"
    ERR_NOSUCHNICK        = "401"
    ERR_NOSUCHSERVER      = "402"
    ERR_NOSUCHCHANNEL     = "403"
    ERR_CANNOTSENDTOCHAN  = "404"
    ERR_TOOMANYCHANNELS   = "405"
    ERR_WASNOSUCHNICK     = "406"
    ERR_TOOMANYTARGETS    = "407"
    ERR_NOSUCHSERVICE     = "408"
    ERR_NOORIGIN          = "409"
    ERR_NORECIPIENT       = "411"
    ERR_NOTEXTTOSEND      = "412"
    ERR_NOTOPLEVEL        = "413"
    ERR_WILDTOPLEVEL      = "414"
    ERR_BADMASK           = "415"
    ERR_TOOMANYMATCHES    = "416"
    ERR_UNKNOWNCOMMAND    = "421"
    ERR_NOMOTD            = "422"
    ERR_NOADMININFO       = "423"
    ERR_FILEERROR         = "424"
    ERR_NONICKNAMEGIVEN   = "431"
    ERR_ERRONEUSNICKNAME  = "432"
    ERR_NICKNAMEINUSE     = "433"
    ERR_NICKCOLLISION     = "436"
    ERR_UNAVAILRESOURCE   = "437"
    ERR_USERNOTINCHANNEL  = "441"
    ERR_NOTONCHANNEL      = "442"
    ERR_USERONCHANNEL     = "443"
    ERR_NOLOGIN           = "444"
    ERR_SUMMONDISABLED    = "445"
    ERR_USERSDISABLED     = "446"
    ERR_NOTREGISTERED     = "451"
    ERR_NEEDMOREPARAMS    = "461"
    ERR_ALREADYREGISTRED  = "462"
    ERR_NOPERMFORHOST     = "463"
    ERR_PASSWDMISMATCH    = "464"
    ERR_YOUREBANNEDCREEP  = "465"
    ERR_YOUWILLBEBANNED   = "466"
    ERR_KEYSET            = "467"
    ERR_CHANNELISFULL     = "471"
    ERR_UNKNOWNMODE       = "472"
    ERR_INVITEONLYCHAN    = "473"
    ERR_BANNEDFROMCHAN    = "474"
    ERR_BADCHANNELKEY     = "475"
    ERR_BADCHANMASK       = "476"
    ERR_NOCHANMODES       = "477"
    ERR_BANLISTFULL       = "478"
    ERR_NOPRIVILEGES      = "481"
    ERR_CHANOPRIVSNEEDED  = "482"
    ERR_CANTKILLSERVER    = "483"
    ERR_RESTRICTED        = "484"
    ERR_UNIQOPPRIVSNEEDED = "485"
    ERR_NOOPERHOST        = "491"
    ERR_UMODEUNKNOWNFLAG  = "501"
    ERR_USERSDONTMATCH    = "502"

    def self.from message
      prefix, type, parameters = parse(message)

      case type
      when "213", "214", "215", "216", "217", "218", "231",
           "232", "233", "240", "241", "244", "245", "246",
           "247", "250", "300", "316", "361", "362", "363",
           "373", "384", "492"
        # Reserved but not in official use
      else
        new(prefix, type, parameters)
      end
    rescue e : Malformed
    end

    private def self.parse message
      prefix = MemoryIO.new
      type = MemoryIO.new
      parameters = [] of String
      parameter = MemoryIO.new
      state = :start

      message.each_char do |char|
        case state
        when :prefix, :start
          case char
          when ':'
            if state == :prefix
              prefix << char
            else
              state = :prefix
            end
          when ' '
            state = :type
          when '\r', '\n'
            raise Malformed.new
          else
            if state == :start
              state = :type
              type << char
            else
              prefix << char
            end
          end
        when :type
          case char
          when ' '
            state = :parameter
          when '\r', '\n'
            raise Malformed.new
          else
            type << char
          end
        when :parameter
          case char
          when ':'
            if parameter.empty? # Only trail if preceded by space
              state = :trail
            else
              parameter << char
            end
          when '\r', '\n'
          when ' '
            parameters << parameter.to_s
            parameter = MemoryIO.new
            state = :trail if parameters.size == 14
          else
            parameter << char
          end
        when :trail
          case char
          when '\r', '\n'
          when ':'
            parameter << char unless parameter.empty? # skip leading :
          else
            parameter << char
          end
        end
      end

      # Freenode violates the RFC and may send us trailing whitespace
      parameter = parameter.to_s.strip
      parameters << parameter unless parameter.empty?

      prefix = prefix.to_s
      prefix = nil if prefix.empty?

      if state == :trail || state == :parameter
        {prefix, type.to_s, parameters}
      else
        raise Malformed.new
      end
    end

    getter prefix
    getter type
    getter parameters

    def initialize(@prefix : String?, @type : String, @parameters : Array(String))
    end

    def initialize(@type : String, @parameters : Array(String))
    end

    def message
      case type
      when PRIVMSG, NOTICE
        parameters.last
      else
        parameters.first
      end
    end

    def mask
      Mask.parse prefix.not_nil!
    end

    def to_s(io)
      io << ':' << @prefix << ' ' if @prefix
      io << @type
      parameters = @parameters.dup
      last = parameters.pop { nil }

      parameters.each do |parameter|
        io << ' '
        io << parameter
      end

      if last
        io << ' '
        io << ':' if last.includes?(' ') || last.includes?(' ')
        io << last
      end

      io << "\r\n" unless last && last.ends_with? '\n'
    end

    class Malformed < Exception
    end
  end
end
