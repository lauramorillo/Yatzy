class SameOfAKindStrategy < ScoreStrategy
  def initialize(times)
    @times = times
  end

  def score(dice)
    counts = count_by_number(dice)
    counts.keys.reverse.each do |number|
      return number*@times if counts[number] >= @times
    end
    return 0  
  end
end