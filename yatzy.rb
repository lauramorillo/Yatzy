require_relative 'same_of_a_number_strategy'
require_relative 'chance_strategy'
require_relative 'yatzy_strategy'
require_relative 'two_pair_strategy'
require_relative 'same_of_a_kind_strategy'
require_relative 'straight_strategy'
require_relative 'full_house_strategy'

class Yatzy

  STRATEGIES = {:ones => SameOfANumberStrategy.new(1),
                :twos => SameOfANumberStrategy.new(2),
                :threes => SameOfANumberStrategy.new(3),
                :fours => SameOfANumberStrategy.new(4),
                :fives => SameOfANumberStrategy.new(5),
                :sixes => SameOfANumberStrategy.new(6),
                :chance => ChanceStrategy.new,
                :yatzy => YatzyStrategy.new,
                :two_pair => TwoPairStrategy.new,
                :score_pair => SameOfAKindStrategy.new(2),
                :three_of_a_kind => SameOfAKindStrategy.new(3),
                :four_of_a_kind => SameOfAKindStrategy.new(4),
                :smallStraight => StraightStrategy.new(:small),
                :largeStraight => StraightStrategy.new(:large),
                :fullHouse => FullHouseStrategy.new}

  EXPECTED_ARGUMENTS = 5

  def initialize(d1, d2, d3, d4, d5)
    @dice = []
    @dice[0] = d1
    @dice[1] = d2
    @dice[2] = d3
    @dice[3] = d4
    @dice[4] = d5
  end

  def method_missing(method, *arguments, &block)
    if STRATEGIES[method]
      STRATEGIES[method].score(@dice)     
    else
      super
    end
  end
  
  def self.method_missing(method, *arguments, &block)
    if arguments.length == Yatzy::EXPECTED_ARGUMENTS
      yatzy_arguments = arguments
    else
      yatzy_arguments = arguments[0]
    end
    if Yatzy::STRATEGIES[method]
      Yatzy.new(*yatzy_arguments).send(method) 
    else
      super
    end
  end
end
