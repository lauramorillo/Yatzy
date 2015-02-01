require_relative 'score_strategy'
class ChanceStrategy < ScoreStrategy
  def score(dice)
    dice.inject(:+)
  end
end