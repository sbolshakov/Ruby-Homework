require_relative 'validation' 

class Test

  extend Validation

  attr_reader :rules

  def initialize(name=nil)
    @name2 = name
  end

    validate :name2, :arg_presence
    validate :name2, :arg_type, String
    validate :name2, :arg_format, /\Aa{3}\z/i
    validate :name2, :arg_length, 3

end

class Test2

  extend Validation

  def initialize(name=nil)
    @name = name
  end

    validate :name, :arg_presence
    validate :name, :arg_type, String
    validate :name, :arg_format, /\Aa{3}\z/i

end
