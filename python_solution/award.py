class Award(object):
    def __init__(self, name=None, expires_in=None, quality=None):
        self.name = name
        self.expires_in = expires_in
        self.quality = quality

    def _valid_quality(self):
        return self.quality in range(1, 50)

    def _increase_quality_by(self, value):
        self.quality += value

    def _decrease_quality_by(self, value):
        self.quality -= value

    def quality_before_expiration(self):
        if self._valid_quality():
            if self.name == "Blue First":
                self._increase_quality_by(1)
            elif self.name == "Blue Compare":
                if self.expires_in <= 10:
                    self._increase_quality_by(3 if self.expires_in <= 5 else 2)
                else:
                    self._increase_quality_by(1)
            elif self.name == "Blue Star":
                self._decrease_quality_by(2)
            else:
                self._decrease_quality_by(1)

    def quality_pass_expiration(self):
        self.expires_in -= 1
        if self.expires_in < 0 and self._valid_quality():
            if self.name == "Blue First":
                self._increase_quality_by(1)
            elif self.name == "Blue Compare":
                self._decrease_quality_by(self.quality)
            elif self.name == "Blue Star":
                self._decrease_quality_by(2)
            else:
                self._decrease_quality_by(1)
