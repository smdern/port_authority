require 'spec_helper'

describe PortAuthority::Session do
  let(:session) { PortAuthority::Session.new("some_host", "awesome_user") }

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
      Net::SFTP.should_receive(:start).with("some_host", "awesome_user", {}, &some_code)
      session.start(&some_code)
    end
  end
end

