class OysterCard
	attr_reader :balance , :in_journey , :entry_station
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	MINIMUM_AMOUNT = 1
	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
		@in_journey = false
		@entry_station

	end

	def top_up(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end


	def touch_in(station)
		fail "You cannot travel as you have less than £#{MINIMUM_AMOUNT}" if @balance < MINIMUM_AMOUNT
		@entry_station = station
		@in_journey = true
	end


	def touch_out
		deduct
		@in_journey = false
	end

	private

	def deduct
		@balance -= MINIMUM_AMOUNT
	end
end
