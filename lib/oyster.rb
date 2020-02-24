class OysterCard
    attr_accessor :balance
    DEFAULT_BALANCE = 0

    def initialize(balance = DEFAULT_BALANCE)
        @balance = balance
    end

end