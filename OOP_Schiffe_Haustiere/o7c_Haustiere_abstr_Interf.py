from abc import ABC, abstractmethod

class Haustier(ABC):
    def __init__(self, name):
        self.name = name

    @abstractmethod
    def geraeusch(self):
        pass

class Spielbar(ABC):
    @abstractmethod
    def spielen(self):
        pass

class Hund(Haustier, Spielbar):

    def geraeusch(self):
        return "Wuff"

    def spielen(self):
        print(f"{self.name} holt den Ball.")

hund = Hund("Bello")
print(hund.geraeusch())
hund.spielen()

# Vergleich abstrakte Klasse und Interface:

# Abstrakte Klasse - "ist ein"
# Hund ist ein Haustier.

# Interface - "kann etwas"
# Hund kann spielen (Spielbar).
