require_relative 'instance_counter'

class Test

  include InstanceCounter

  def initialize

    self.register_instance

  end

end
