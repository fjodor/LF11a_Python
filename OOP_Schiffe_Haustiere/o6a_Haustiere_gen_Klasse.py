from typing import Generic, TypeVar, List

T = TypeVar("T", bound="Haustier")

class Haustier:
    def __init__(self, name: str):
        self.name = name
        self._energie = 100

    def fressen(self):
        self._energie += 10
        print(f"{self.name} frisst. Energie = {self._energie}")


class Hund(Haustier):
    def fressen(self):
        self._energie += 20
        print(f"{self.name} (Hund) knabbert an einem Knochen. Energie = {self._energie}")


class Katze(Haustier):
    def fressen(self):
        self._energie += 15
        print(f"{self.name} (Katze) frisst Fisch. Energie = {self._energie}")


class Futterstation(Generic[T]):
    def __init__(self):
        self.tiere: List[T] = []

    def aufnehmen(self, tier: T):
        self.tiere.append(tier)

    def fuettern_alle(self):
        for t in self.tiere:
            t.fressen()
