class BlueCompare
  attr_accessor :obj

  def initialize(obj)
    self.obj = obj
  end

  def current_value
    self.obj.expires_in <= 0 ? -self.obj.quality : (self.obj.expires_in <= 10 ? (self.obj.expires_in <= 5 ? 3 : 2) : 1)
  end
end
