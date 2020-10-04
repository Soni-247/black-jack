class Card
    attr_reader :value, :suit

    def initialize(value, suit)
      @value = value
      @suit = suit
    end
    
    def to_s
    "#{@value} of #{@suit}"
    end

    def to_c
      """
      +-----+
      |#{@value}|
      |     |
      |  #{@suit}  
      |     |
      |    #{@value}|
      +-----+
      """
    end
end