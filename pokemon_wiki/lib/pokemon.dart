class Pokemon {
  final List<Ability> abilities;
  final double base_exp;
  final List<Form> forms;
  final double height;
  final List<Item> items;
  final int id;
  final bool def;
  final List<Move> moves;
  final String name;
  final double order;
  final Species species;
  final Sprite sprite;
  final List<Stats> stats;
  final List<Type> types;
  final double weight;

  Pokemon({
      this.abilities,
      this.base_exp,
      this.forms,
      this.height,
    this.items,
    this.id,
    this.def,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprite,
    this.stats,
    this.types,
    this.weight});

  factory Pokemon.fromJSON(Map<String, dynamic> json) {
    return Pokemon(abilities: json);
  }
}

class Ability {
  final String name;
  final bool hidden;
  final int slot;

  Ability({this.name, this.hidden, this.slot});

  factory Ability.fromJSON(Map<String, dynamic> json) {
    return Ability(
        name: json['ability']['name'],
        hidden: json['is_hidden'],
        slot: json['slot']);
  }
}

class Form {}

class Item {}

class Move {}

class Species {}

class Sprite {}

class Stats {}

class Type {}
