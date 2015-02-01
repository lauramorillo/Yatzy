class StraightStrategy < ScoreStrategy
  STRAIGHTS = {:small => {:from => 1, :to => 5, :points => 15},
               :large => {:from => 2, :to => 6, :points => 20}}
  def initialize(kind)
    @kind = kind
  end

  def score(dice)
    straight = STRAIGHTS[@kind]
    counts = count_by_number(dice)
    (straight[:from]..straight[:to]).each {|number| return 0 unless counts[number] ==  1}
    return straight[:points]
  end
end