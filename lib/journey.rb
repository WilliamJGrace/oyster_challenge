require 'oyster.rb'

class Journey

  PENALTY_FARE = 6

  attr_accessor :entry_station, :complete

  def initialize(entry_info = {entry_station: "barbican"})
    @complete = complete
    @entry_station = entry_info[:entry_station]
  end

  def complete?
    false
  end
  def fare
    PENALTY_FARE
  end
  def finish(station)
    station = self
  end
end
