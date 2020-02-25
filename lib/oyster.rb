class OysterCard
	attr_reader :balance , :in_journey
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
		@in_journey = false
	
	end

	def top_up(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end

	def deduct(num)
		@balance -= num
	end
	
	def touch_in
		@in_journey = true
	  
	end 


	def touch_out

		@in_journey = false

	end

end
