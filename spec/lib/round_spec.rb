require 'spec_helper'

describe Round do
  let(:rock_player) { RockPlayer.new }
  let(:rock_player2) { RockPlayer.new }
  let(:paper_player) { PaperPlayer.new }
  let(:paper_player2) { PaperPlayer.new }
  let(:scissors_player) { ScissorsPlayer.new }
  let(:scissors_player2) { ScissorsPlayer.new }

  it 'should be a round' do
    expect(subject).to be_a(Round)
  end

  describe ".results" do
    describe "any player vs no-player" do
      it "returns [player, nil]" do
        round = Round.new(rock_player, nil)
        expect(round.play).to eq([rock_player, nil])
      end

      it "returns [player, nil]" do
        round = Round.new(nil, rock_player)
        expect(round.play).to eq([rock_player, nil])
      end
    end
    describe "for RockPlayer vs PaperPlayer" do
      it "returns [paper_player, rock_player]" do
        round = Round.new(rock_player, paper_player)
        expect(round.play).to eq([paper_player, rock_player])
      end
    end

    describe "for PaperPlayer vs RockPlayer" do
      it "returns [paper_player, rock_player]" do
        round = Round.new(paper_player, rock_player)
        expect(round.play).to eq([paper_player, rock_player])
      end
    end

    describe "for PaperPlayer vs ScissorsPlayer" do
      it "returns [scissors_player, paper_player]" do
        round = Round.new(paper_player, scissors_player)
        expect(round.play).to eq([scissors_player, paper_player])
      end
    end

    describe "for ScissorsPlayer vs PaperPlayer" do
      it "returns [scissors_player, paper_player]" do
        round = Round.new(scissors_player, paper_player)
        expect(round.play).to eq([scissors_player, paper_player])
      end
    end

    describe "for RockPlayer vs ScissorsPlayer" do
      it "returns [rock_player, scissors_player]" do
        round = Round.new(rock_player, scissors_player)
        expect(round.play).to eq([rock_player, scissors_player])
      end
    end

    describe "for ScissorsPlayer vs RockPlayer" do
      it "returns [rock_player, scissors_player]" do
        round = Round.new(scissors_player, rock_player)
        expect(round.play).to eq([rock_player, scissors_player])
      end
    end

    describe "for ScissorsPlayer vs ScissorsPlayer" do
      it "returns [scissors_player, scissors_player]" do
        round = Round.new(scissors_player2, scissors_player)
        expect(round.play).to eq([scissors_player2, scissors_player])
      end
    end

    describe "for RockPlayer vs RockPlayer" do
      it "returns [rock_player, rock_player]" do
        round = Round.new(rock_player2, rock_player)
        expect(round.play).to eq([rock_player2, rock_player])
      end
    end

    describe "for PaperPlayer vs PaperPlayer" do
      it "returns [paper_player, paper_player]" do
        round = Round.new(paper_player2, paper_player)
        expect(round.play).to eq([paper_player2, paper_player])
      end
    end

    describe "when player_one returns valid input, player_two does not" do
      it "returns [player_one, player_two]" do
        paper_player.stub(:play).and_return('lizard')
        round = Round.new(rock_player, paper_player)
        expect(round.play).to eq([rock_player, paper_player])
      end
    end

    describe "when player_two returns valid input, player_one does not" do
      it "returns [player_two, player_one]" do
        rock_player.stub(:play).and_return('lizard')
        round = Round.new(rock_player, paper_player)
        expect(round.play).to eq([paper_player, rock_player])
      end
    end
  end
end