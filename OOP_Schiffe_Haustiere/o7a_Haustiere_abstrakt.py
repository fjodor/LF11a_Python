from abc import ABC, abstractmethod

class Haustier(ABC):
    def __init__(self, name):
        self.name = name

    @abstractmethod
    def geraeusch(self):
        pass

class Hund(Haustier):
    def geraeusch(self):
        return "Wuff"

class Katze(Haustier):
    def geraeusch(self):
        return "Miau"

hund = Hund("Bello")
katze = Katze("Minka")

print(hund.name, "macht", hund.geraeusch())
print(katze.name, "macht", katze.geraeusch())

# Besonderheit: abstrakte Klasse kann nicht instanziiert werden
# tier = Haustier("Tierchen")

# "Vererbung ermöglicht Polymorphie. Abstrakte Klassen erzwingen Polymorphie."
