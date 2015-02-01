class FullHouseStrategy < ScoreStrategy
  def score(dice)
    score = 0
    counts = count_by_number(dice)
    pair = false
    threesome = false

    counts.each do |number, count|
      if (count == 2)
        score += number * 2
        pair = true
      elsif count == 3
        score += number * 3
        threesome = true
      end
    end

    return score if pair && threesome
    return 0
  end
end