class OysterCard
	attr_accessor :balance
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
	end

	def top_up(num)
		fail 'You cant top up more than £90 balance' if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end
	def deduct(num)
		@balance -= num
	end
end
