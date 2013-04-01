require 'spec_helper'

describe PortAuthority::Session do
  let(:session) { PortAuthority::Session.new("some_host", "awesome_user", foo: 'bar') }

  describe "#initialize" do
    it "should set the host" do
      session.host.should == "some_host"
    end

    it "should set the username" do
      session.username.should == "awesome_user"
    end

    it "should set options" do
      session.options.should be_a Hash
      session.options.should include({ foo: 'bar' })
    end
  end

  describe "#start" do
    before do
      Net::SFTP.stub(:start)
    end

    it "shouldn't do anything unless a block is given" do
      session.start
      Net::SFTP.should_not_receive(:start)
    end

    it "should start the session and pass the block" do
      some_code = lambda { }
      Net::SFTP.should_receive(:start).with("some_host", "awesome_user", {foo: 'bar'}, &some_code)
      session.start(&some_code)
    end
  end
end

