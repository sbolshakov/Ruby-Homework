require_relative 'vendor'

class Railcar

  include Vendor

  attr_reader :empty_space, :type, :max_space
  attr_accessor :number

  def initialize(max_space, type)
    @max_space = max_space
    @empty_space = max_space
    @type = type.to_sym
    validate!
  end

  def validate!
    raise ArgumentError, "Тип вагона можеть быть только passenger или cargo" if type.nil? || type.empty? || (type != :passenger && type != :cargo)
    raise ArgumentError, "Количество мест или объем вагона не может быть меньше или равен нулю" if max_space.nil? || max_space <= 0
    true
  end

  def validate?
    validate!
  rescue ArgumentError
    false
  end

  def occupied_space
    @max_space - @empty_space
  end

end

