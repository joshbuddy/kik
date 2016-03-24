require 'optparse'
require "kik/version"
require "kik/runner"

module Kik

  def self.start(args)
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end
      opts.on("-p", "--port=PORT", "Specify port to check") do |p|
        options[:port] = p
      end
    end.parse!(args.clone)

    command_index = args.find_index('--')
    raise 'command must be provided after --' unless command_index

    command = args.slice(command_index + 1, args.count)

    Runner.new(options[:port], options[:verbose], command).start
  end

end
