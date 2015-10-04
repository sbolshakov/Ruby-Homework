require_relative 'railcar'

class PassengerRailcar < Railcar

  def initialize (max_space, type = :passenger)
    super
    @type = :passenger
  end

  def occupy_space
    @empty_space -= 1 if @empty_space > 0
  end

  def free_space
    @empty_space += 1 if @empty_space < @max_space
  end

end

