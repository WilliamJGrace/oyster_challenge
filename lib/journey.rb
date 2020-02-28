
class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  attr_accessor :entry_station, :exit_station, :complete

  def initialize
    @complete = complete
    @entry_station
    @exit_station
  end

  def start(station)
    @entry_station = station
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end

  def fare
    if complete?
      MIN_FARE
    else
      PENALTY_FARE
    end
  end

  def finish(station)
    @exit_station = station
  end
end
