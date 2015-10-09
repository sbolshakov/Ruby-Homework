class Route

  attr_reader :first_station, :stops, :last_station

  def initialize (first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    raise ArgumentError, "Передаваемый аргумент должен быть типа Station" if @first_station.class != Station || @last_station.class != Station
    @stops = []
  end

  def add_stop(station)
    raise ArgumentError, "Такая станция уже есть в маршруте" if @stops.include?(station) || station == @first_station || station == @last_station
    raise ArgumentError, "Передаваемый аргумент должен быть типа Station" if station.class != Station
    @stops << station
  end

  def remove_station(station)
    @stops.delete(station)
  end

  def print
    [@first_station.name, @stops.compact.map { |station| station.name }, @last_station.name].flatten
  end

end
