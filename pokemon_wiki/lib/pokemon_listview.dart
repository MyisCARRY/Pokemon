import 'package:flutter/material.dart';
import 'package:pokemon_wiki/pokemon.dart';
import 'pokemon_container.dart';

class PokemonListView extends StatelessWidget {
  final List<Row> rows = [];
  final List<Future<Pokemon>> pokemons;

  PokemonListView(this.pokemons);

  void createRows(int num) {
    List<PokemonContainer> containers = [];

    for (int i = 0; i < pokemons.length; i++) {
      containers.add(PokemonContainer(pokemons[i]));

      if (containers.length == num || i == pokemons.length - 1) {
        rows.add(Row(
          children: containers.toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ));
        containers.clear();
      }
    }
  }

  void init() {
    createRows(3);
  }

  @override
  Widget build(BuildContext context) {
    init();
    return ListView(
      children: rows,
    );
  }
}
