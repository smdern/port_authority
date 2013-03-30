class PortAuthority::Session
  require 'net/sftp'

  def initialize(host, username, options={})
    @host = host
    @username = username
    @options = options
  end

  def start(&block)
    Net::SFTP.start(@host, @username, @options, &block) if block_given?
  end
end

