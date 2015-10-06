require_relative 'vendor'

class Railcar

  include Vendor

  attr_reader :empty_space, :type
  attr_accessor :number

  def initialize(max_space, type)
    @max_space = max_space
    @empty_space = max_space
    @type = type.to_sym
  end

  def occupied_space
    @max_space - @empty_space
  end

end

