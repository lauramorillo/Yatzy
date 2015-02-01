class TwoPairStrategy < ScoreStrategy
  def score(dice)
    counts = count_by_number(dice)

    score = 0
    counts.each do |number, times|
      score += 2*number if times >= 2
    end
    score
  end
end