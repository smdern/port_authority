require 'spec_helper'

describe PortAuthority::Application do

  # let(:app) { PortAuthority::Application.new("some_host", "awesome_user")}
  let(:app) { PortAuthority::Application.new("localhost", "shaun", password: 'sejn595K')}

  describe "#list_directory" do
    it "shouldn't do anything if no path is specified" do
      app.list_directory
    end

    it "should list the contents of the directory" do
      app.list_directory("/Users/shaun/Desktop").each do |file|
        puts file.name
      end
    end
  end
end

