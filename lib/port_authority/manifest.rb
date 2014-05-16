module PortAuthority
  class Manifest

    attr_reader :target_directory

    def initialize(target_directory)
      @target_directory = target_directory
    end

    def contents
      @contents ||= begin
      end
    end
  end
end

