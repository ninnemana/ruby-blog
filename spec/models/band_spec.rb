require 'spec_helper'
require_relative '../../models/band'

describe Band do
  context "given a valid Band instance with attribute" do
    let(:band) { Band.new(name: "Joe") }

    subject { band }
    it { should_not be_nil }
    it { should be_an_instance_of(Band)}
    it { should have_attribute(:name) }
    it { should respond_to(:save)}

    # context "when saving valid instance" do
    #   subject { band.save }
    #   it {should == true}
    # end

  end

  context "given an invalid Band instance with attribute" do
    let(:band) { Band.new(fake_attribute: "Fake") }

    subject { band }
    it { should_not be_valid }

    context "when saving instance" do
      subject {band.save}
      it {should == false}
    end
  end

end