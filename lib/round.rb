class Round
  attr_accessor :player_one, :player_two

  def initialize(player_one=nil, player_two=nil)
    self.player_one = player_one
    self.player_two = player_two
  end

  def play
    return [player_two, player_one] if player_one.nil?
    return [player_one, player_two] if player_two.nil?
    winners = (1..100).map do
      determine_winner
    end
    results = Hash.new
    results[player_one] = 0
    results[player_two] = 0
    results = winners.inject(results) { |h,v| h[v] += 1; h }
    if results[player_one] == results[player_two]
      [player_one, player_two]
    else
      results.sort_by{|player, wins| wins}.reverse.map(&:first)
    end
  end

  private
  def determine_winner
    result = [player_one.play.downcase, player_two.play.downcase]
    #puts "Result is #{result}"
    case result
      when ['rock', 'paper']
        player_one.lost
        player_two.won
        player_two
      when ['paper', 'rock']
        player_one.won
        player_two.lost
        player_one
      when ['paper', 'scissors']
        player_one.lost
        player_two.won
        player_two
      when ['scissors', 'paper']
        player_one.won
        player_two.lost
        player_one
      when ['rock', 'scissors']
        player_one.won
        player_two.lost
        player_one
      when ['scissors', 'rock']
        player_one.lost
        player_two.won
        player_two
      when ['scissors', 'scissors']
        player_one.tied
        player_two.tied
        player_one
      when ['rock', 'rock']
        player_one.tied
        player_two.tied
        player_one
      when ['paper', 'paper']
        player_one.tied
        player_two.tied
        player_one
      else
        if valid_result?(result.first)
          # Player one gave a valid result
          player_one.won
          player_two.lost
          player_one
        elsif valid_result?(result.last)
          # Player two gave a valid result
          player_one.lost
          player_two.won
          player_two
        end
    end
  end

  def valid_result?(result)
    ['rock', 'paper', 'scissors'].include?(result)
  end
end