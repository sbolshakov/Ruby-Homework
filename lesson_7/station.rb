class Station

  @@instances = []

  def self.all
    @@instances
  end

  attr_reader :name, :trains_on_station

  def initialize(name)
    @@instances << self
    @name = name
    @trains_on_station = {}
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

end
