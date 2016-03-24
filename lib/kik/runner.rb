module Kik
  class Runner
    def initialize(port, verbose, command)
      @port, @command, @verbose = port, command, verbose
    end

    def start
      puts "Running `#{@command.join(' ')}' watching port #{@port} for a listener!" if @verbose
      while true
        run_command unless check_port
        sleep 5
      end
    end

    private
    def check_port
      out = `lsof -i :#{@port}`
      out.strip!
      listening = !out.empty?
      puts "Checked port #{@port}, it is #{listening ? 'listening' : 'not listening'}" if @verbose
      listening
    end

    private
    def run_command
      clean_child!
      @child_pid = Process.spawn(*@command)
    end

    def clean_child!
      return unless @child_pid
      begin
        return unless Process.kill(0, @child_pid) == 1
        puts "Child process still alive, killing" if @verbose
        Process.kill(9, @child_pid)
      rescue Errno::ESRCH
        # do nothing
      end
    end
  end
end
