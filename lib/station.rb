class Station
  attr_reader :station_name, :zone
  def initialize(station_info)

    @station_name = station_info[:name]
    @zone = station_info[:zone]

  end

end
