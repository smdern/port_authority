require 'spec_helper'

describe PortAuthority::Session do
  let(:host) { 'some_host' }
  let(:user) { 'some_user' }
  let(:options) { { foo: 'bar' } }
  let(:session) { PortAuthority::Session.new(host, user, options) }

  describe "#initialize" do
    it "should set the host" do
      session.host.should == host
    end

    it "should set the username" do
      session.username.should == user
    end

    it "should set options" do
      session.options.should be_a Hash
      session.options.should include(options)
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
      some_block = proc { 'bar' }
      expect(Net::SFTP).to receive(:start).with(host, user, options) { |&block| expect(block).to eq(some_block) }

      session.start(&some_block)
    end
  end
end

