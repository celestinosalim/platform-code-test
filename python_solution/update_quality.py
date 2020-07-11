def update_quality(awards):
    [award.calculate_quality() for award in awards]
