require_relative 'passenger_railcar'
require_relative 'passenger_train'
require_relative 'cargo_railcar'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'

@stations_list = {}
@routes_list = {}
@trains_list = {}
@passenger_cars_list = []
@cargo_cars_list = []

def print_stations_list
  @stations_list.keys.each { | value | puts value }
end

def print_trains_list
  puts 'Список поездов:'
  @trains_list.keys.each { | number | puts "Поезд номер #{number} тип #{@trains_list[number].type}" }
  puts 'Введите номер поезда или "выход" для выхода'
  gets.chomp
end

def passenger_car
  input = print_trains_list
  if input == "выход"
    exit
  elsif @trains_list[input].type != :passenger
    puts 'Поезд не является пассажирским.'
    exit
  end
  puts 'Список вагонов поезда'
  cars = {}
  @trains_list[input].cars.each do |car|
    cars[car.number] = car
    puts "Вагон номер #{car.number} свободных мест #{car.empty_space}"
  end
  puts 'Введите номер вагона или "выход" для выхода'
  num = gets.chomp
  num != "выход" ? cars[num.to_i] : num
end

def cargo_car
  input = print_trains_list
  if input == "выход"
    exit
  elsif @trains_list[input].type != :cargo
    puts 'Поезд не является грузовым.'
    exit
  end
  puts 'Список вагонов поезда'
  cars = {}
  @trains_list[input].cars.each do |car|
    cars[car.number] = car
    puts "Вагон номер #{car.number} свободных объем #{car.empty_space}"
  end
  puts 'Введите номер вагона или "выход" для выхода'
  num = gets.chomp
  num != "выход" ? cars[num.to_i] : num
end

def main_menu
  loop do
    puts 'Введите номер пункта меню для выбора или "выход" для выхода'
    puts ' 1 - Создать станцию'
    puts ' 2 - Создать маршрут'
    puts ' 3 - Создать поезд'
    puts ' 4 - Прицепить вагон к поезду'
    puts ' 5 - Отцепить вагон от поезда'
    puts ' 6 - Поместить поезд на станцию'
    puts ' 7 - Загрузить грузовой вагон'
    puts ' 8 - Разгрузить грузовой вагон'
    puts ' 9 - Занять место в пассажирском вагоне'
    puts '10 - Освободить место в пассажирском вагоне'
    puts '11 - Показать список станций'
    puts '12 - Показать список поездов на станции'
    input = gets.chomp
    break if input == "выход"
    next if input.to_i < 1 || input.to_i > 12

    case input.to_i
    when 1
      create_station
    when 2
      create_route
    when 3
      create_train
    when 4
      add_car
    when 5
      remove_car
    when 6
      train_to_station
    when 7
      print "Введите объем груза: "
      volume = gets.chomp.to_i
      add_cargo(volume)
    when 8
      print "Введите объем груза: "
      volume = gets.chomp.to_i
      remove_cargo(volume)
    when 9
      add_passenger
    when 10
      remove_passenger
    when 11
      print_stations_list
    when 12
      trains_on_station
    end
  end
end

def create_station
  puts 'Введите название новой станции или "выход" для возврата в главное меню: '
  loop do
    input = gets.chomp.to_s
    break if input == 'выход'
    @stations_list[input] = Station.new(input)
  end
end

def create_route
  print "Введите название маршрута: "
  route_name = gets.chomp.to_s
  puts "Список станций: "
  print_stations_list
  print "Введите первую станцию маршрута: "
  input = gets.chomp.to_s
  first_station = @stations_list[input]
  print "Введите последнюю станцию маршрута: "
  input = gets.chomp.to_s
  last_station = @stations_list[input]
  @routes_list[route_name] = Route.new(first_station, last_station)
  print 'Вводите остановки или введите "выход" для окончания создания маршрута: '
  loop do
    break if input == 'выход'
    input = gets.chomp.to_s
    @routes_list[route_name].add_stop(@stations_list[input])
  end
  print "Создан маршрут #{route_name}: "
  @routes_list[route_name].print.each { |station| print "#{station} "}
end

def create_train
  puts 'Введите номер пункта меню для выбора или "выход" для возврата в главное меню: '
  puts ' 1 - Создать пассажирский поезд'
  puts ' 2 - Создать грузовой поезд'
  input = gets.chomp
  exit if input == 'выход'
  case input.to_i
  when 1
    puts 'Вводите номера поездов или "выход" для возврата в предыдущее меню'
    loop do
      input = gets.chomp
      break if input == 'выход'
      @trains_list[input] = PassengerTrain.new(input)
    end
  when 2
    puts 'Вводите номера поездов или "выход" для возврата в предыдущее меню'
    loop do
      input = gets.chomp
      break if input == 'выход'
      @trains_list[input] = CargoTrain.new(input)
    end
  end
end

def add_car
  loop do
    input = print_trains_list
    break if input == "выход"
    if @trains_list[input].type == :passenger
      puts 'Введите количество мест в вагоне'
      seats = gets.chomp.to_i
      @trains_list[input].add_car(PassengerRailcar.new(seats))
    elsif @trains_list[input].type == :cargo
      puts 'Введите доступный объем для груза в вагоне'
      space = gets.chomp.to_i
      @trains_list[input].add_car(CargoRailcar.new(space))
    end
  end
end

def remove_car
  loop do
    input = print_trains_list
    break if input == "выход"
    cars = {}
    @trains_list[input].cars.each { |car| cars[car.number] = car }
    puts cars[1]
    if cars.empty?
      puts "У поезда нет вагонов"
      next
    else
      puts "Список вагонов поезда номер #{@trains_list[input].number}: "
      cars.keys.each { |car| puts car}
      puts "Введите номер вагона, которые вы хотите отцепить"
      number = gets.chomp.to_i
      puts number
      puts cars[number]
      @trains_list[input].remove_car(cars[number])
    end
  end
end

def train_to_station
  loop do
    input = print_trains_list
    break if input == "выход"
    train = @trains_list[input]
    puts "Введите станцию для телепортации туда поезда"
    puts "Список станций: "
    print_stations_list
    input = gets.chomp.to_s
    @stations_list[input].train_arrive(train)
  end
end

def add_passenger
  loop do
    car = passenger_car
    puts car
    break if car == "выход"
    car.empty_space > 0 ? car.occupy_space : ( puts "Нет мест в вагоне" )
  end
end

def add_cargo(volume)
    car = cargo_car
    cargo_volume = volume
    car.empty_space >= cargo_volume.to_i ? car.occupy_space(cargo_volume) : (puts "Нет места в вагоне")
end

def remove_passenger
  loop do
    car = passenger_car
    break if car == "выход"
    car.occupied_space > 0 ? car.free_space : (puts "Нет пассажиров в вагоне")
  end
end

def remove_cargo(volume)
    car = cargo_car
    exit if car == "выход"
    cargo_volume = volume
    car.occupied_space >= cargo_volume.to_i ? car.free_space(cargo_volume) : (puts "Не достаточно груза в вагоне")
end

def trains_on_station
  loop do
    puts 'Введите станцию для получения списка поездов или "выход" для выхода'
    puts 'Список доступных станций:'
    print_stations_list
    input = gets.chomp.to_s
    break if input == "выход"
    puts "На станции #{@stations_list[input].name} находятся следующие поезда:"
    @stations_list[input].trains_on_station.keys.each { |num| puts num }
  end
end

main_menu













