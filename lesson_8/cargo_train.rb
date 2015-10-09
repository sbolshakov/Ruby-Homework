require_relative 'train'
class CargoTrain < Train

  def initialize (number, type = :cargo)
    super
    @type = :cargo
  end

end
