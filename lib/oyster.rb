require_relative "journey"
class OysterCard
	attr_reader :balance , :entry_station, :journeys
	DEFAULT_BALANCE = 0
	MAXIMUM_BALANCE = 90
	MINIMUM_AMOUNT = 1

	def initialize(balance = DEFAULT_BALANCE)
		@balance = balance
		@entry_station
		@journeys = []
		@current_trip
	end

	def top_up(num)
		fail "You cant top up more than #{MAXIMUM_BALANCE} balance" if (@balance + num) > MAXIMUM_BALANCE
		@balance += num
	end


	def touch_in(station)
		fail "You cannot travel as you have less than £#{MINIMUM_AMOUNT}" if @balance < MINIMUM_AMOUNT
		if @current_trip != nil
			deduct
		end
		@current_trip = Journey.new
		@current_trip.start(station)
	end

	def in_journey?
    !!@entry_station
	end

	def touch_out(exit_station)
  # @journeys << {entry_station: @entry_station, exit_station: exit_station}
    if @current_trip == nil
			@current_trip = Journey.new
		else
		  @current_trip.finish(exit_station)
		end
    deduct
		# @entry_station = nil
	end



	private

	def deduct
		@balance -= @current_trip.fare
		@current_trip = nil
	end
end
