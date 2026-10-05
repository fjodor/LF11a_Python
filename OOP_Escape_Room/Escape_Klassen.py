class Room:
    def __init__(self, name, description):
        self._name = name
        self._description = description
        self._doors = []
        self._items = []

    def add_door(self, door):
        self._doors.append(door)

    def add_item(self, item):
        self._items.append(item)

    def enter(self):
        print(f"\n== {self._name} ==")
        print(self._description)

    def show_items(self):
        if not self._items:
            print("Hier liegen keine Items.")
        else:
            print("Items im Raum:")
            for item in self._items:
                print(f"- {item.name}")

    def show_doors(self):
        print("Türen:")
        for i, door in enumerate(self._doors):
            status = "offen" if door.is_open else "geschlossen"
            print(f"{i}: Tür zu {door.target_room._name} ({status})")

    def take_item(self, item_name):
        for item in self._items:
            if item.name == item_name:
                self._items.remove(item)
                return item
        return None


class Door:
    def __init__(self, target_room):
        self._target_room = target_room
        self._is_open = False

    @property
    def is_open(self):
        return self._is_open

    @property
    def target_room(self):
        return self._target_room

    def open(self):
        self._is_open = True

    def close(self):
        self._is_open = False


class NormalDoor(Door):
    """Eine einfache Tür ohne besondere Logik."""
    pass


class KeyDoor(Door):
    """Tür, die nur mit einem bestimmten Schlüssel geöffnet werden kann."""
    def __init__(self, target_room, required_key):
        super().__init__(target_room)
        self._required_key = required_key

    def try_open(self, player):
        if player.has_item(self._required_key):
            print(f"Du benutzt den Schlüssel '{self._required_key}'.")
            self.open()
            return True
        else:
            print("Diese Tür ist verschlossen. Du brauchst einen Schlüssel.")
            return False


class Item:
    def __init__(self, name, description):
        self._name = name
        self._description = description

    @property
    def name(self):
        return self._name

    def describe(self):
        print(f"{self._name}: {self._description}")


class Player:
    def __init__(self, start_room):
        self._current_room = start_room
        self._inventory = []

    def enter_current_room(self):
        self._current_room.enter()

    def show_inventory(self):
        if not self._inventory:
            print("Inventar ist leer.")
        else:
            print("Inventar:")
            for item in self._inventory:
                print(f"- {item.name}")

    def has_item(self, name):
        return any(item.name == name for item in self._inventory)

    def take_item(self, item_name):
        item = self._current_room.take_item(item_name)
        if item:
            self._inventory.append(item)
            print(f"Du hast '{item_name}' aufgenommen.")
        else:
            print(f"Kein Item namens '{item_name}' gefunden.")

    def go_through(self, door_index):
        try:
            door = self._current_room._doors[door_index]
        except IndexError:
            print("Ungültige Türnummer.")
            return

        if not door.is_open:
            if isinstance(door, KeyDoor):
                door.try_open(self)
            else:
                door.open()

        if door.is_open:
            self._current_room = door.target_room
            self.enter_current_room()
        else:
            print("Die Tür ist noch geschlossen.")
