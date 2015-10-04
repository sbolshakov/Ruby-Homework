require_relative 'train'
class PassengerTrain < Train

  def initialize (number, type = :passenger)
    super
    @type = :passenger
  end

end
