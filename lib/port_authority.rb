module PortAuthority
  class Application
    require "port_authority/session"

    def initialize(host, username, options={})
      @host = host
      @username = username
      @options = options
    end

    def list_directory(path='')
      files = []

      unless path.empty?
        start_session do |sftp|
          sftp.dir.foreach(path) do |entry|
            files << entry
          end
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

