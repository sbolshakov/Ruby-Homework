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

def print_trains_list(type)
  puts 'Список поездов:'
  @trains_list.keys.each do | number |
    puts "Поезд номер #{number} тип #{@trains_list[number].type}" if @trains_list[number].type == type.to_sym
  end
  @trains_list.keys.each do | number |
    puts "Поезд номер #{number} тип #{@trains_list[number].type}" if type.to_sym == :all
  end
  puts 'Введите номер поезда или "выход" для выхода'
  input =  gets.chomp
  raise SystemExit if input == "выход"
  raise ArgumentError, "Поезда нет в списке" if @trains_list[input] == nil
  input
end

def passenger_car
  input = print_trains_list(:passenger)
  raise SystemExit if input == "выход"
  raise ArgumentError, "Поезд не является пассажирским" if @trains_list[input].type != :passenger
  puts "Список вагонов поезда"
  cars = {}
  @trains_list[input].cars.each do |car|
    cars[car.number] = car
    puts "Вагон номер #{car.number} свободных мест #{car.empty_space}"
  end
  puts 'Введите номер вагона или "выход" для выхода'
  num = gets.chomp.to_i
  raise ArgumentError, "Вагона нет в списке" if cars[num] == nil
  raise SystemExit if num == "выход"
  cars[num.to_i]
end

def cargo_car
  input = print_trains_list(:cargo)
  raise SystemExit if input == "выход"
  raise ArgumentError, "Поезд не является пассажирским" if @trains_list[input].type != :cargo
  puts 'Список вагонов поезда'
  cars = {}
  @trains_list[input].cars.each do |car|
    cars[car.number] = car
    puts "Вагон номер #{car.number} свободных объем #{car.empty_space}"
  end
  puts 'Введите номер вагона или "выход" для выхода'
  num = gets.chomp.to_i
  raise ArgumentError, "Вагона нет в списке" if cars[num] == nil
  raise SystemExit if num == "выход"
  cars[num]
end

def enter_station
  input = gets.chomp.to_s
  raise SystemExit if input == "выход"
  raise ArgumentError, "Станции нет в списке" if @stations_list[input] == nil
  @stations_list[input]
end

def menu
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
  rescue ArgumentError => e
    puts e.message
    retry
end

def create_route
  print "Введите название маршрута: "
  route_name = gets.chomp.to_s
  begin
    puts "Список станций: "
    print_stations_list
    print "Введите первую станцию маршрута: "
    first_station = enter_station
    print "Введите последнюю станцию маршрута: "
    last_station = enter_station
    @routes_list[route_name] = Route.new(first_station, last_station)
    print 'Вводите остановки или введите "выход" для окончания создания маршрута: '
    loop do
      begin
        station = enter_station
        @routes_list[route_name].add_stop(station)
      rescue SystemExit
        break
      rescue ArgumentError => e
        puts e.message
        retry
      end
    end
    puts "Создан маршрут #{route_name}: "
    @routes_list[route_name].print.each { |station| print "#{station} "}
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

def create_train
  puts 'Введите номер пункта меню для выбора или "выход" для возврата в главное меню: '
  puts ' 1 - Создать пассажирский поезд'
  puts ' 2 - Создать грузовой поезд'
  input = gets.chomp
  exit if input == 'выход'
  case input.to_i
  when 1
    puts 'Вводите номера поездов или "выход" для окончания ввода и возврата в главное меню'
    loop do
      begin
        input = gets.chomp
        break if input == 'выход'
        @trains_list[input] = PassengerTrain.new(input)
      rescue ArgumentError => e
        puts e.message
        retry
      end
    end
  when 2
    puts 'Вводите номера поездов или "выход" для окончания ввода и возврата в главное меню'
    loop do
      begin
        input = gets.chomp
        break if input == 'выход'
        @trains_list[input] = CargoTrain.new(input)
      rescue ArgumentError => e
        puts e.message
        retry
      end
    end
  end
end

def add_car
  loop do
    begin
      input = print_trains_list(:all)
      if @trains_list[input].type == :passenger
        puts 'Введите количество мест в вагоне'
        seats = gets.chomp.to_i
        @trains_list[input].add_car(PassengerRailcar.new(seats))
      elsif @trains_list[input].type == :cargo
        puts 'Введите доступный объем для груза в вагоне'
        space = gets.chomp.to_i
        @trains_list[input].add_car(CargoRailcar.new(space))
      end
    rescue SystemExit
      break
    rescue ArgumentError => e
      puts e.message
      retry
    end
  end
end

def remove_car
  loop do
    begin
      input = print_trains_list(:all)
      cars = {}
      @trains_list[input].cars.each { |car| cars[car.number] = car }
      if cars.empty?
        puts "У поезда нет вагонов"
        next
      else
        puts "Список вагонов поезда номер #{@trains_list[input].number}: "
        cars.keys.each { |car| puts car}
        puts "Введите номер вагона, которые вы хотите отцепить"
        number = gets.chomp.to_i
        if cars[number] == nil
          puts "Вагона нет в списке"
          next
        end
        @trains_list[input].remove_car(cars[number])
      end
    rescue SystemExit
      break
    rescue ArgumentError => e
      puts e.message
      retry
    end
  end
end

def train_to_station
  begin
    input = print_trains_list(:all)
    train = @trains_list[input]
    begin
      puts "Введите станцию для телепортации туда поезда"
      puts "Список станций: "
      print_stations_list
      input = enter_station
    rescue ArgumentError => e
      puts e.message
      retry
    end
    input.train_arrive(train)
  rescue SystemExit
    menu
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

def add_passenger
  begin
    car = passenger_car
    puts car
    car.empty_space > 0 ? car.occupy_space : ( puts "Нет мест в вагоне" )
  rescue SystemExit
    menu
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

def add_cargo(volume)
  begin
    car = cargo_car
    cargo_volume = volume
    car.empty_space >= cargo_volume.to_i ? car.occupy_space(cargo_volume) : (puts "Нет места в вагоне")
  rescue SystemExit
    menu
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

def remove_passenger
  begin
    car = passenger_car
    car.occupied_space > 0 ? car.free_space : (puts "Нет пассажиров в вагоне")
  rescue SystemExit
    menu
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

def remove_cargo(volume)
  begin
    car = cargo_car
    cargo_volume = volume
    car.occupied_space >= cargo_volume.to_i ? car.free_space(cargo_volume) : (puts "Не достаточно груза в вагоне")
  rescue SystemExit
    menu
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

def trains_on_station
  begin
    puts 'Введите станцию для получения списка поездов или "выход" для выхода'
    puts 'Список доступных станций:'
    print_stations_list
    input = enter_station
    puts "На станции #{input.name} находятся следующие поезда:"
    input.trains_on_station.keys.each { |num| puts num }
  rescue SystemExit
    menu
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

menu











