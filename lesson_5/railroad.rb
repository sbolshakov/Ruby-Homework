class Station

  attr_reader :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains_on_station = []
  end

  def train_arrive(train)
    @trains_on_station << train
  end

  def train_depart(train)
    @trains_on_station.delete(train)
  end

  def trains_list
    @trains_on_station.map { |train| train.train_number }
  end

  def trains_list_by_type
    list_by_type = Hash.new(0)
    @trains_on_station.map { |train| train.train_type }.each { |index| list_by_type[index] += 1 }
    list_by_type
  end

end

class Train

  attr_reader :train_type, :current_speed, :num_of_cars, :train_number, :train_route, :train_route_position

  def initialize (train_number, train_type, num_of_cars)
    @current_speed = 0
    @train_number = train_number
    @train_type = train_type.to_sym
    @num_of_cars = num_of_cars
  end

  def increase_speed
   speed = @current_speed + 10
   @current_speed = speed if speed <= 110
  end

  def decrease_speed
    speed = @current_speed - 10
    @current_speed = speed if speed >= 0
  end

  def add_car
    @num_of_cars += 1 if @current_speed == 0
  end

  def remove_car
    num_of_cars = @num_of_cars - 1
    @num_of_cars = num_of_cars if @current_speed == 0 && num_of_cars >= 0
  end

  def add_route (route)
    @train_route = [route.first_station, route.stops, route.last_station].flatten
    @train_route_position = route.first_station
  end

  def route_go_next_station
    @train_route_position != @train_route.last ? next_station_index = @train_route.index(@train_route_position) + 1 : next_station_index = @train_route.index(@train_route_position)
    @train_route_position = @train_route[next_station_index]
  end

  def route_go_prev_station
    @train_route_position != @train_route.first ? next_station_index = @train_route.index(@train_route_position) - 1 : next_station_index = @train_route.index(@train_route_position)
    @train_route_position = @train_route[next_station_index]
  end

  def nearby_stations
    nearby_stations = {}
    if @train_route_position != @train_route.first
      nearby_stations[:prev_station] = @train_route[@train_route.index(@train_route_position) - 1]
    else
      nearby_stations[:prev_station] = 'Находимся на первой станции'
    end
    nearby_stations[:current_station] = @train_route_position
    if @train_route_position != @train_route.last
      nearby_stations[:next_station] = @train_route[@train_route.index(@train_route_position) + 1]
    else
      nearby_stations[:next_station] = 'Находимся на последней станции'
    end
    nearby_stations
  end

end

class Route

  attr_reader :first_station, :stops, :last_station

  def initialize (first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stops = []
  end

  def add_stop(station_name)
    @stops << station_name
  end

  def remove_station(station_name)
    @stops.delete(station_name)
  end

  def route_print
    route = [@first_station.station_name, @stops.map { |station| station.station_name }, @last_station.station_name].flatten
  end

end



