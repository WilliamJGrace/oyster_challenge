class OysterCard
	attr_reader :balance 
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	def initialize(balance = DEFAULT_BALANCE, touch_in = false, touch_out = false, in_journey = false)
		@balance = balance
		@touch_in = touch_in
		@touch_out = touch_out
		@in_journey = in_journey
	end

	def top_up(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end

	def deduct(num)
		@balance -= num
	end

	def touch_in
		@touch_in = true
		@touch_out = true
		@in_journey = true
	end

	def touch_out
		@touch_in = false
		@touch_out = true
		@in_journey = false
	end

	def in_journey?
		@in_journey
	end
end
