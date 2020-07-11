class Award
  attr_accessor :name, :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def add_quality(value)
    self.quality += value if (self.quality + value).between?(0, 50)
  end

  def calculate_quality
    return if self.name == "Blue Distinction Plus"
    valid_product = {
      "Blue First": self.expires_in <= 0 && self.quality < 49 ? 2 : 1,
      "Blue Compare": self.expires_in <= 0 ? -self.quality : (self.expires_in <= 10 ? (self.expires_in <= 5 ? 3 : 2) : 1),
      "Blue Star": self.expires_in <= 0 ? -4 : -2,
    }
    self.expires_in -= 1
    add_quality(valid_product[self.name.to_sym] ? valid_product[self.name.to_sym] : self.expires_in > 0 ? -1 : -2)
  end
end
