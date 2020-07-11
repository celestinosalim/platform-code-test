class Award
  attr_accessor :name, :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def valid_quality?
    self.quality.between?(1, 49)
  end

  def increase_quality_by(value)
    self.quality += value
  end

  def decrease_quality_by(value)
    self.quality -= value
  end

  def handle_before_expiration
    return unless self.valid_quality?
    case self.name
    when "Blue First"
      increase_quality_by(1)
    when "Blue Compare"
      increase_quality_by(self.expires_in <= 10 ? (self.expires_in <= 5 ? 3 : 2) : 1)
    when "Blue Star"
      decrease_quality_by(2)
    else
      decrease_quality_by(1)
    end
  end

  def handle_pass_expiration
    self.expires_in -= 1
    return unless self.expires_in < 0 && self.valid_quality?
    case self.name
    when "Blue First"
      increase_quality_by(1)
    when "Blue Compare"
      decrease_quality_by(self.quality)
    when "Blue Star"
      decrease_quality_by(2)
    else
      decrease_quality_by(1)
    end
  end
end
