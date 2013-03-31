module PortAuthority
  class Application
    require "port_authority/session"

    def initialize(host, username, options={})
      @host = host
      @username = username
      @options = options
    end

    def directory_contents(path='')
      files = []

      unless path.empty?
        start_session do |sftp|
          sftp.dir.foreach(path) do |entry|
            files << entry unless %w[. ..].include?(entry.name)
          end
        end
      end
      files
    end

    def list_directory(path='')
      directory_contents(path).each do |file|
        puts file.name
      end
    end

    private

    def start_session(&block)
      PortAuthority::Session.new(@host, @username, @options).start(&block)
    end
  end
end

