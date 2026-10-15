class Hundefutter:
    def __init__(self, name):
        self.name = name

class Katzenfutter:
    def __init__(self, name):
        self.name = name

class Vogelfutter:
    def __init__(self, name):
        self.name = name

class HundeRegal:

    def __init__(self):
        self.futter = []

    def einlagern(self, futter):
        self.futter.append(futter)

    def bestand_anzeigen(self):
        print("\nHunde-Regal:")
        for artikel in self.futter:
            print("-", artikel.name)
        print(f"Anzahl Artikel: {len(self.futter)}")

class KatzenRegal:

    def __init__(self):
        self.futter = []

    def einlagern(self, futter):
        self.futter.append(futter)

    def bestand_anzeigen(self):
        print("\nKatzen-Regal:")
        for artikel in self.futter:
            print("-", artikel.name)
        print(f"Anzahl Artikel: {len(self.futter)}")

class VogelRegal:

    def __init__(self):
        self.futter = []

    def einlagern(self, futter):
        self.futter.append(futter)

    def bestand_anzeigen(self):
        print("\nVogel-Regal:")
        for artikel in self.futter:
            print("-", artikel.name)
        print(f"Anzahl Artikel: {len(self.futter)}")


# Anwendung

# 1. Listen anlegen

hunde_regal = HundeRegal()
katzen_regal = KatzenRegal()
vogel_regal = VogelRegal()

# 2. Futter aufnehmen

hunde_regal.einlagern(Hundefutter("Rind-Menü"))
hunde_regal.einlagern(Hundefutter("Kauknochen"))

katzen_regal.einlagern(Katzenfutter("Lachs-Menü"))
katzen_regal.einlagern(Katzenfutter("Geflügel-Mix"))

vogel_regal.einlagern(Vogelfutter("Hirse"))
vogel_regal.einlagern(Vogelfutter("Körner-Mix"))

# 3. Inventur

print("Inventur!")
hunde_regal.bestand_anzeigen()
katzen_regal.bestand_anzeigen()
vogel_regal.bestand_anzeigen()


# Eine gewisse Redundanz dürfte nicht zu leugnen sein ...
# Aufgabe: Refactoring
