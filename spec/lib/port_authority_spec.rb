require 'spec_helper'

describe PortAuthority::Application do
  let(:app) { PortAuthority::Application.new("some_host", "awesome_user")}
  let(:session) { mock }

  before do
    PortAuthority::Session.stub(:new).and_return(session)
  end

  describe "#start_session" do
    before do
      PortAuthority::Application.send(:public, *PortAuthority::Application.private_instance_methods)
    end

    it "should start a session and pass in the block" do
      some_code = lambda { }
      PortAuthority::Session.should_receive(:new).with("some_host", "awesome_user", {})
      session.should_receive(:start).with(&some_code)
      app.start_session(&some_code)
    end
  end


  describe "#list_directory" do
    it "should return an empty aray" do
      session.should_not_receive(:start)
      app.list_directory.should == []
    end

    it "should return an array" do
      app.stub(:start_session)
      app.list_directory("some/path").should be_a Array
    end
  end
end

