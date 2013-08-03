require 'spec_helper'

describe ScissorsPlayer do
  # subject = ScissorsPlayer.new
  it "should be a ScissorsPlayer" do
    expect(subject).to be_a(ScissorsPlayer)
  end

  describe ".play" do
    it "returns 'Scissors' the first time it's called" do
      expect(subject.play).to eq('scissors')
    end

    it "returns 'scissors' the second time it's called" do
      subject.play
      expect(subject.play).to eq('scissors')
    end

    it "returns 'scissors' the first 100 times it's called" do
      100.times do
        expect(subject.play).to eq('scissors')
      end
    end
  end

  describe ".won" do
    it "does nothing" do
      expect(subject.won).to be_nil
    end
  end

  describe ".lost" do
    it "does nothing" do
      expect(subject.lost).to be_nil
    end
  end

  describe ".tied" do
    it "does nothing" do
      expect(subject.tied).to be_nil
    end
  end
end
