module NewAttrAccessors

  def attr_accessor_with_history(*names)
    
    names.each do |name|
      
      var_name = "@#{name}".to_sym
      var_name_history = "@#{name}_history".to_sym

      define_method(name) {instance_variable_get(var_name)}
      
      define_method("#{name}_history") {instance_variable_get(var_name_history)}
      
      define_method("#{name}=") do |value|
        current_value = instance_variable_get(var_name)
        if current_value && current_value != value 
          instance_variable_set(var_name_history,[]) unless instance_variable_get(var_name_history)
          history = instance_variable_get(var_name_history)
          history << instance_variable_get(var_name)
        end
        instance_variable_set(var_name, value)
      end
    
    end
  
  end

  def strong_attr_accessor(name, type)

    var_name = "@#{name}".to_sym
    var_type = "@#{name}_type".to_sym

    define_method(name) {instance_variable_get(var_name)}

    define_method("#{name}=") do |value|
      if value.class == type
        instance_variable_set(var_name, value)
      else
        raise ArgumentError, "Переменная #{name} является переменной типа #{type}. 
        Вы пытаетесь присвоить значение типа #{value.class}"
      end
    end
  end

end

class Test
  extend NewAttrAccessors

  attr_accessor_with_history :test, :test2, :test3
  strong_attr_accessor :foo, Float


end

