from OOP_Escape_Room.Escape_Klassen import Room, Door, NormalDoor, KeyDoor, Item, Player

# Räume
start = Room("Startraum", "Ein kleiner Raum mit einer verschlossenen Tür.")
flur = Room("Flur", "Ein langer Flur. Eine Tür führt weiter.")

# Items
key = Item("Schlüssel", "Ein alter, rostiger Schlüssel.")

start.add_item(key)

# Türen
door1 = KeyDoor(flur, "Schlüssel")
start.add_door(door1)

door2 = NormalDoor(start)
flur.add_door(door2)

# Spieler
p = Player(start)
p.enter_current_room()

# Interaktion
p.show_inventory()
p.take_item("Schlüssel")
p.show_inventory()

start.show_doors()
p.go_through(0)  # durch die Schlüsseltür gehen
