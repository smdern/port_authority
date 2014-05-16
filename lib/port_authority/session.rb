require 'net/sftp'

module PortAuthority
  class Session

    attr_reader :host, :username, :options

    def initialize(host, username, options={})
      @host = host
      @username = username
      @options = options
    end

    def start(&block)
      Net::SFTP.start(host, username, options, &block) if block_given?
    end
  end
end
