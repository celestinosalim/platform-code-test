class NormalAward:
    def __init__(self, obj):
        self.obj = obj

    @property
    def current_value(self):
        if self.obj.expires_in <= 0:
            return -2
        else:
            return -1
