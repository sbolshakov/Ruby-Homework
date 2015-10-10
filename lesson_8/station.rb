class Station

  @@instances = []

  def self.all
    @@instances
  end

  attr_accessor :name, :trains_on_station

  def initialize(name)
    @name = name
    validate!
    @@instances << self
    @trains_on_station = {}
  end

  def valid?
    validate!
  rescue ArgumentError
    false
  end



  def train_arrive(train)
    @trains_on_station[train.number] = train
  end

  def train_depart(train)
    @trains_on_station.delete(train.number)
  end

  def trains_list
    # @trains_on_station.map { |train| train.number }
    @trains_on_station
  end

  def trains_list_by_type
    list_by_type = Hash.new(0)
    @trains_on_station.map { |train| train.type }.each { |index| list_by_type[index] += 1 }
    list_by_type
  end

  protected

  def validate!
    raise ArgumentError, "Имя станции не может быть пустым" if name.nil? || name.empty?
    raise ArgumentError, "Имя должно быть длинее двух символов" if name.length < 3
    true
  end


end
