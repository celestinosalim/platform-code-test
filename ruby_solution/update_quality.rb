require "award"

def update_quality(awards)
  awards.map(&:calculate_quality)
end
