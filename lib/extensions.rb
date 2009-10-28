class Object
  def try(method)
    send method if respond_to? method
  end
end

class Array
  def extract_options!
    last.is_a?(Hash) ? pop : {}
  end
end