from python_solution.award_types.BlueCompare import BlueCompare
from python_solution.award_types.BlueStar import BlueStar
from python_solution.award_types.BlueFirst import BlueFirst
from python_solution.award_types.NormalAward import NormalAward


class Award(object):
    def __init__(self, name="", expires_in=None, quality=None):
        self.name = name
        self.expires_in = expires_in
        self.quality = quality

    def _add_quality(self, value):
        if 0 <= (self.quality + value) <= 50:
            self.quality += value

    def calculate_quality(self):
        if self.name == "Blue Distinction Plus":
            return
        valid_award_types = {
            "Blue First": BlueFirst(self).current_value,
            "Blue Compare": BlueCompare(self).current_value,
            "Blue Star": BlueStar(self).current_value,
        }
        self.expires_in -= 1
        self._add_quality(
            valid_award_types.get(self.name, NormalAward(self).current_value)
        )

