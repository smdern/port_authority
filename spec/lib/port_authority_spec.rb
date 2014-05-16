require 'spec_helper'

describe PortAuthority::Application do
  let(:app) { PortAuthority::Application.new("some_host", "awesome_user")}
  let(:session) { double }

  before do
    PortAuthority::Session.stub(new: session)
  end

  describe "#directory_contents" do
    it "should return an array" do
      app.stub(:start_session)
      session.should_not_receive(:start)
      app.directory_contents.should be_a Array
    end
  end

  describe "#list_directory" do
    let(:contents) { [double(name: "bar"), double(name: "baz")] }

    before do
      app.stub(:directory_contents).and_return(contents)
    end

    it "should print out the contents of target directory" do
      app.should_receive(:puts).with('bar').ordered
      app.should_receive(:puts).with('baz').ordered
      app.list_directory("some/path")
    end
  end
end

