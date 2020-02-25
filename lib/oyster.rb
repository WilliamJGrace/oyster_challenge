class OysterCard
	attr_reader :balance 
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
	
	end

	def top_up(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end

	def deduct(num)
		@balance -= num
	end
	
	def touch_in
	  true
	end 

	def in_journey?
	  if touch_in 
	    true
	  end
	  
	end

	def touch_out
	end

end
