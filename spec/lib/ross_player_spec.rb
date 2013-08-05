require 'ross_player'

describe RossPlayer do
  # subject = RossPlayer.new
  it "should be a RossPlayer" do
    expect(subject).to be_a(RossPlayer)
  end

  describe ".play" do
    play_array = ["rock", "paper","scissors"]
    it "returns rock, paper or scissors" do
      expect(play_array).to include(subject.play)
    end

    describe ".won" do
      it "does nothing" do
        expect(subject.won).to_not raise_error
      end

      it "should increase the win count by 1" do
        expect{ subject.won }.to change(subject, :wins).from(0).to(1)
        expect{ subject.won }.to change(subject, :wins).from(1).to(2)
      end

      describe ".lost" do
        it "does nothing" do
          expect(subject.lost).to_not raise_error
        end

        it "should increase the lost count by 1" do
          expect{ subject.lost }.to change(subject, :losses).from(0).to(1)
          expect{ subject.lost }.to change(subject, :losses).from(1).to(2)
        end

        describe ".tied" do
          it "should increase the tied count by 1" do
            expect{ subject.tied }.to change(subject, :ties).from(0).to(1)
            expect{ subject.tied }.to change(subject, :ties).from(1).to(2)
          end
        end
      end
    end
  end
end