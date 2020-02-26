class OysterCard
	attr_reader :balance , :entry_station, :journeys
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	MINIMUM_AMOUNT = 1
	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
		@entry_station
		@journeys = []
	end

	def top_up(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end


	def touch_in(entry_station)
		fail "You cannot travel as you have less than £#{MINIMUM_AMOUNT}" if @balance < MINIMUM_AMOUNT
		@entry_station = entry_station
	end

	def in_journey?
    !!@entry_station
	end

	def touch_out(exit_station)
		deduct
		@journeys << {entry_station: @entry_station, exit_station: exit_station}
		@entry_station = nil
	end



	private

	def deduct
		@balance -= MINIMUM_AMOUNT
	end
end
