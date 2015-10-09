require_relative 'vendor'

class Train

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  include Vendor

  attr_reader :type, :current_speed, :number, :route, :route_position, :cars

  def initialize (number, type)
    @current_speed = 0
    @number = number
    @type = type.to_sym
    validate!
    @cars = []
    @@trains[number] = self
  end

  def validate!
    raise ArgumentError, "Тип поезда можеть быть только passenger или cargo" if type.nil? || type.empty? || (type != :passenger && type != :cargo)
    raise ArgumentError, "Неверный номер поезда. Формат xxx-xx" unless number =~ /\A[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}\z/i
    raise ArgumentError, "Такой номер поезда уже есть!" if @@trains.keys.include?(number)
    true
  end

  def validate?
    validate!
  rescue ArgumentError
    false
  end

  def increase_speed
   speed = @current_speed + 10
   @current_speed = speed if speed <= 110
  end

  def decrease_speed
    speed = @current_speed - 10
    @current_speed = speed if speed >= 0
  end

  def add_car(car)
    raise ArgumentError, "Тип вагона и тип поезда не совпадает" if car.type != self.type
    @cars << car
    car.number = @cars.index(car) + 1 # Начинаем нумерацию вагонов с единицы
  end

  def remove_car(car)
    @cars.delete(car)
    @cars.each { |car_index| car_index.number = @cars.index(car_index) + 1 }
    # car.number = nil
  end

  def add_route (route)
    @route = [route.first_station, route.stops, route.last_station].flatten
    @route_position = route.first_station
  end

  def route_go_next_station
    next_station_index = @route_position != @route.last ?  @route.index(@route_position) + 1 :  @route.index(@route_position)
    @route_position = @train_route[next_station_index]
  end

  def route_go_prev_station
    next_station_index = @route_position != @route.first ?  @route.index(@route_position) - 1 : @route.index(@route_position)
    @route_position = @route[next_station_index]
  end

  def nearby_stations
    nearby_stations = {}
    if @route_position != @route.first
      nearby_stations[:prev_station] = @route[@route.index(@route_position) - 1]
    else
      nearby_stations[:prev_station] = 'Находимся на первой станции маршрута'
    end
    nearby_stations[:current_station] = @route_position
    if @route_position != @route.last
      nearby_stations[:next_station] = @route[@route.index(@route_position) + 1]
    else
      nearby_stations[:next_station] = 'Находимся на последней станции маршрута'
    end
    nearby_stations
  end

end
