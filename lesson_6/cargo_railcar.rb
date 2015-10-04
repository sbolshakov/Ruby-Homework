require_relative 'railcar'

class CargoRailcar < Railcar

  def initialize (max_space, type = :cargo)
    super
    @type = :cargo
  end

  def occupy_space (volume)
    @empty_space -= volume if (@empty_space - volume) >= 0
  end

  def free_space (volume)
    @empty_space += volume if (@empty_space + volume) <= @max_space
  end

end
