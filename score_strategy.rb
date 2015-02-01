class ScoreStrategy
  MAX_DICE_NUMBER = 6

  def score(dice)
    0
  end

  protected
    def count_by_number(dice)
      counts = {}
      (0..MAX_DICE_NUMBER).each {|number| counts[number] = 0}
      dice.each do |die| 
        counts[die] += 1
      end
      counts
    end
end