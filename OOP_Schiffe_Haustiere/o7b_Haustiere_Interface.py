from abc import ABC, abstractmethod

class Spielbar(ABC):
    @abstractmethod
    def spielen(self):
        pass

class Hund(Spielbar):
    def spielen(self):
        print("Hund holt den Ball.")

class Katze(Spielbar):
    def spielen(self):
        print("Katze jagt einen Wollknäuel.")

hund = Hund()
katze = Katze()

hund.spielen()
katze.spielen()

# Test:
class Goldfisch(Spielbar):
    pass

# Bruno = Goldfisch()
