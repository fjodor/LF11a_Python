class Hund:
    def __init__(self, name):
        self.name = name

    def zeige_hund(self):
        print(f"Hund {self.name} wird vorgestellt")

class Katze:
    def __init__(self, name):
        self.name = name

    def katze_anzeigen(self):
        print(f"Katze {self.name} wird vorgestellt")

class Wellensittich:
    def __init__(self, name):
        self.name = name

    def vogel_praesentieren(self):
        print(f"Wellensittich {self.name} wird vorgestellt")

# Tiere aufnehmen

tiere = [Hund("Bello"), Hund("Waldi"), Katze("Fiona"), Katze("Lolita"), Wellensittich("Tikko"), Wellensittich("Takko")]

# Tiere anzeigen

for tier in tiere:

    if isinstance(tier, Hund):
        tier.zeige_hund()

    elif isinstance(tier, Katze):
        tier.katze_anzeigen()

    elif isinstance(tier, Wellensittich):
        tier.vogel_praesentieren()
