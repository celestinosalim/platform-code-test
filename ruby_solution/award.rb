require "award_types/BlueFirst"
require "award_types/BlueCompare"
require "award_types/BlueStar"
require "award_types/NormalAward"

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
      "Blue First": BlueFirst.new(self).current_value,
      "Blue Compare": BlueCompare.new(self).current_value,
      "Blue Star": BlueStar.new(self).current_value,
    }
    self.expires_in -= 1
    add_quality(valid_product[self.name.to_sym] ? valid_product[self.name.to_sym] : NormalAward.new(self).current_value)
  end
end
