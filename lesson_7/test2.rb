require_relative 'instance_counter'

class Test2

  include InstanceCounter

  def initialize

    self.register_instance

  end

end
