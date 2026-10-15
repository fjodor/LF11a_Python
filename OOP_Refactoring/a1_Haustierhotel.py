class Hund:
    def __init__(self, name):
        self.name = name

    def vorstellen(self):
        print(f"Wuff-wuff! Ich bin Hund {self.name}")

    def schlafen(self):
        print(f"{self.name} schläft")


class Katze:
    def __init__(self, name):
        self.name = name

    def vorstellen(self):
        print(f"Maunz-maunz! Ich bin Katze {self.name}")

    def schlafen(self):
        print(f"{self.name} schläft")


class Wellensittich:
    def __init__(self, name):
        self.name = name

    def vorstellen(self):
        print(f"Knusperzwitsch! Ich bin Wellensittich {self.name}")

    def schlafen(self):
        print(f"{self.name} schläft")

Bello = Hund("Bello")
Bello.vorstellen()

Mietzi = Katze("Mietzi")
Mietzi.vorstellen()
Mietzi.schlafen()

Bruno = Wellensittich("Bruno")
Bruno.vorstellen()

# Code ist nicht besonders elegant
# DRY: don't repeat yourself
# Aufgabe: Refactoring

