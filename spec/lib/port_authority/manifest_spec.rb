require 'spec_helper'

describe PortAuthority::Manifest do
  let(:manifest) { PortAuthority::Manifest.new("remote/path/directory") }

  describe "#initialize" do
    it "should set the target_directory" do
      manifest.target_directory.should == "remote/path/directory"
    end
  end

  describe "#contents" do
    it "should " do

    end
  end
end

