class YatzyStrategy < ScoreStrategy
  def score(dice)
    first_number = dice[0];
    dice.slice(1..dice.length).each do |die|
      return 0 unless die == first_number
    end
    return 50
  end
end