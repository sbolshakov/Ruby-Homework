class Route

  attr_reader :first_station, :stops, :last_station

  def initialize (first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stops = []
  end

  def add_stop(station)
    @stops << station
  end

  def remove_station(station)
    @stops.delete(station)
  end

  def print
    [@first_station.name, @stops.compact.map { |station| station.name }, @last_station.name].flatten
  end

end
