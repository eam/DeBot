require "fileutils"


def run prog
  er, ew = IO.pipe
  sr, sw = IO.pipe
  system("./sandbox_crystal", "eval", prog, err: ew, out: sw)
  ew.close
  sw.close
  stderr = er.read
  stdout = sr.read
  puts stdout
  puts stderr
  [stdout, stderr, $?.exitstatus]
end

def needed? prog
  stdout, stderr, exitstatus = run prog
  exitstatus != 0 || stderr.include?("Bad system call") || stdout.include?("error code: 31")
end

syscalls = File.readlines(ARGV[0] || "all_syscalls64").map(&:chomp).sort

needed_calls = syscalls

# syscalls -= %w(connect dup2 execve2 )

syscalls.each do |call|
  tmp_calls = needed_calls-[call]
  File.write("sandbox_whitelist", tmp_calls.join("\n"))
  puts "without #{call}:"
  needed = false
  stdout, stderr, exitstatus = run "putss \"hi\""

  if stderr.start_with? "playpen"
    exitstatus = stderr[/with signal (\d+)/, 1].to_i
    needed = true if exitstatus == 31 || stderr.include?("timeout triggered!")
  elsif stderr.include?("Bad system call")
    needed  = true
  end

  needed ||= needed? "puts \"hi\""
  needed ||= needed? "`ls -al`"
  needed ||= needed? "exit"
  needed ||= needed? %(r, w = IO.pipe;  Process.run("/bin/cat", output: w, input: "hi"); p(r.read(1)))
  needed ||= needed? %(LibC.popen("ls", "r"))
  needed ||= needed? %(require "compiler/crystal/**"; Crystal::Parser.parse("foo { |x| x.bar }"))

  unless needed
    needed_calls = tmp_calls
    puts "Dropped #{call}"
  end

  puts
end
