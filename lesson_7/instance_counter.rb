module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_accessor :instances

    # def instances
    #   @instances
    # end

    # def instances_increment
    #   @instances = 0 if instances == nil
    #   @instances += 1
    # end

  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances == nil ? self.class.instances = 1 : self.class.instances += 1
    end

  end
end
