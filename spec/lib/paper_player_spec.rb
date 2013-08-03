require 'spec_helper'

describe PaperPlayer do
  # subject = PaperPlayer.new
  it "should be a PaperPlayer" do
    expect(subject).to be_a(PaperPlayer)
  end

  describe ".play" do
    it "returns 'paper' the first time it's called" do
      expect(subject.play).to eq('paper')
    end

    it "returns 'paper' the second time it's called" do
      subject.play
      expect(subject.play).to eq('paper')
    end

    it "returns 'paper' the first 100 times it's called" do
      100.times do
        expect(subject.play).to eq('paper')
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
