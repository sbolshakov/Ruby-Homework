require_relative 'train'
require_relative 'validation'

class PassengerTrain < Train

extend Validation

  def initialize (number, type = :passenger)
    super
    @type = :passenger
    validate!
  end

validate :type, :arg_type, :passenger
validate :number, :arg_format, /\A[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}\z/i

end
