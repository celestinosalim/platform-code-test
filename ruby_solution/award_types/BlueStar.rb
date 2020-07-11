class BlueStar
  attr_accessor :obj

  def initialize(obj)
    self.obj = obj
  end

  def current_value
    self.obj.expires_in <= 0 ? -4 : -2
  end
end
