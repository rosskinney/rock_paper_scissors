class RossPlayer
  def initialize
    @wins = 0
    @losses = 0
    @ties = 0
  end
  #Greetings Professor Falken, show we play a game?
  #a strange game,
  #the only winning move is not to play, how about a nice game of chess?
  def play
    @play_array = ["rock", "paper", "scissors"]
    @play_array.sample
  end

  def won
    @wins += 1
  end

  def wins
    @wins
  end

  def lost
    @losses += 1
  end

  def losses
    @losses
  end

  def tied
    @ties += 1
  end

  def ties
    @ties
  end
end