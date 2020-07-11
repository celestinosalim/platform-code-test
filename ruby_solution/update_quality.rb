require "award"

def update_quality(awards)
  awards.each do |award|
    next if award.name == "Blue Distinction Plus"
    award.handle_before_expiration
    award.handle_pass_expiration
  end
end
