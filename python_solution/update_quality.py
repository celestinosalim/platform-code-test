def update_quality(awards):
    for award in awards:
        if award.name != "Blue Distinction Plus":
            award.quality_before_expiration()
            award.quality_pass_expiration()
