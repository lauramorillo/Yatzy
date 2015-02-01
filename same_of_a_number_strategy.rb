require_relative 'score_strategy'
class SameOfANumberStrategy < ScoreStrategy
  def initialize(number)
    @number = number
  end

  def score(dice)
    sum = 0
    for at in Array 0..4
      if (dice[at] == @number)
        sum += @number
      end
    end
    return sum
  end
end