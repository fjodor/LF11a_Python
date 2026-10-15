from o6a_Haustiere_gen_Klasse import *

station_hunde = Futterstation[Hund]()
station_hunde.aufnehmen(Hund("Bello"))
station_hunde.aufnehmen(Hund("Rex"))
station_hunde.fuettern_alle()

station_katzen = Futterstation[Katze]()
station_katzen.aufnehmen(Katze("Minka"))
station_katzen.fuettern_alle()

station_allgemein = Futterstation[Haustier]()
station_allgemein.aufnehmen(Haustier("Goldfisch"))
station_allgemein.aufnehmen(Katze("Luna"))
station_allgemein.fuettern_alle()
