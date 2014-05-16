require_relative "port_authority/session"
require_relative "port_authority/progress_handler"

module PortAuthority
  class Application
    def initialize(host, username, options={})
      @host = host
      @username = username
      @options = options
    end

    def directory_contents(path)
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

    def list_directory(path)
      directory_contents(path).each do |file|
        puts "#{file.name} which is #{file.attributes.size} kB"
      end
    end

    def copy_contents(source, destintation)
      start_session do |sftp|
        sftp.download!(source, destintation, recursive: true, progress: PortAuthority::ProgressHandler.new)
      end
    end

    private
    attr_reader :host, :username, :options

    def start_session(&block)
      @session ||= PortAuthority::Session.new(host, username, options)
      @session.start(&block)
    end
  end
end

