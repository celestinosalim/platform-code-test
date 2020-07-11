class NormalAward
  attr_accessor :obj

  def initialize(obj)
    self.obj = obj
  end

  def current_value
    self.obj.expires_in > 0 ? -1 : -2
  end
end
