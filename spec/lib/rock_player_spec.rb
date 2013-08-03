require 'spec_helper'

describe RockPlayer do
  # subject = RockPlayer.new
  it "should be a RockPlayer" do
    expect(subject).to be_a(RockPlayer)
  end

  describe ".play" do
    it "returns 'rock' the first time it's called" do
      expect(subject.play).to eq('rock')
    end

    it "returns 'rock' the second time it's called" do
      subject.play
      expect(subject.play).to eq('rock')
    end

    it "returns 'rock' the first 100 times it's called" do
      100.times do
        expect(subject.play).to eq('rock')
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
