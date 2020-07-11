class BlueCompare:
    def __init__(self, obj):
        self.obj = obj

    @property
    def current_value(self):
        if self.obj.expires_in <= 0:
            return -self.obj.quality
        else:
            if self.obj.expires_in <= 5:
                return 3
            if self.obj.expires_in <= 10:
                return 2
            else:
                return 1

