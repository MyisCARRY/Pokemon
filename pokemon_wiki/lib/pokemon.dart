import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

class Pokemon {
  final List<Ability> abilities;
  final int baseExp;
  final List<Form> forms;
  final int height;
  final List<Item> items;
  final int id;
  final bool def;
  final List<Move> moves;
  final String name;
  final int order;
  final Species species;
  final Sprite sprite;
  final List<Stats> stats;
  final List<Type> types;
  final int weight;

  Pokemon(
      {this.abilities,
      this.baseExp,
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

  factory Pokemon.fromJSON(Map<String, dynamic> response) {
    Iterable l = response['abilities'];
    List<Ability> abilities = l.map((el) => Ability.fromJSON(el)).toList();

    l = response['forms'];
    List<Form> forms = l.map((el) => Form.fromJSON(el)).toList();

    l = response['held_items'];
    List<Item> items = l.map((el) => Item.fromJSON(el)).toList();

    l = response['moves'];
    List<Move> moves = l.map((el) => Move.fromJSON(el)).toList();

    l = response['stats'];
    List<Stats> stats = l.map((el) => Stats.fromJSON(el)).toList();

    l = response['types'];
    List<Type> types = l.map((el) => Type.fromJSON(el)).toList();

    return Pokemon(
        abilities: abilities,
        baseExp: response['base_exp'],
        forms: forms,
        height: response['height'],
        items: items,
        id: response['id'],
        def: response['is_default'],
        moves: moves,
        name: response['name'],
        order: response['order'],
        species: Species.fromJSON(response['species']),
        sprite: Sprite.fromJSON(response['sprites']),
        stats: stats,
        types: types,
        weight: response['weight']);
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

class Form {
  final String name;
  final String url;

  Form({this.name, this.url});

  factory Form.fromJSON(Map<String, dynamic> json) {
    return Form(name: json['name'], url: json['url']);
  }
}

class Item {
  final String name;

  Item({this.name});

  factory Item.fromJSON(Map<String, dynamic> json) {
    return Item(name: json['item']['name']);
  }
}

class Move {
  final String name;

  Move({this.name});

  factory Move.fromJSON(Map<String, dynamic> json) {
    return Move(name: json['move']['name']);
  }
}

class Species {
  final String name;

  Species({this.name});

  factory Species.fromJSON(Map<String, dynamic> json) {
    return Species(name: json['name']);
  }
}

class Sprite {
  final String url;
  final Image img;

  Sprite({this.url, this.img});

  factory Sprite.fromJSON(Map<String, dynamic> jsons) {
    var url = jsons['front_default'];
    Image img = Image.network(
      url,
      fit: BoxFit.fitWidth,
    );

    return Sprite(url: jsons['front_default'], img: img);
  }
}

class Stats {
  final int baseStat;
  final int effort;
  final String name;

  Stats({this.baseStat, this.effort, this.name});

  factory Stats.fromJSON(Map<String, dynamic> json) {
    return Stats(
        baseStat: json['base_stat'],
        effort: json['effort'],
        name: json['stat']['name']);
  }
}

class Type {
  final int slot;
  final String name;

  Type({this.slot, this.name});

  factory Type.fromJSON(Map<String, dynamic> json) {
    return Type(slot: json['slot'], name: json['type']['name']);
  }
}
