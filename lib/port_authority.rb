require "port_authority/version"

module PortAuthority
  class Application

    def initialize(host, username, options={})
      @host = host
      @username = username
      @options = options
    end

    def list_directory(path='')
      return if path.empty?
      files = []

      start_session do |sftp|
        sftp.dir.foreach(path) do |entry|
          files << entry
        end
      end
      files
    end

    private

    def start_session(&block)
      PortAuthority::Session.new(@host, @username, @options).start(&block)
    end
  end
end

