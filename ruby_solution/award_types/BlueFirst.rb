class BlueFirst
  attr_accessor :obj

  def initialize(obj)
    self.obj = obj
  end

  def current_value
    self.obj.expires_in <= 0 && self.obj.quality < 49 ? 2 : 1
  end
end
