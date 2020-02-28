import 'package:flutter/material.dart';

import 'pokemon_container.dart';

class PokemonListView extends StatelessWidget {
  final List<Row> rows = [];
  final List<String> strings = [];

  void populate(int num) {
    for (int i = 0; i < num; i++) strings.add(i.toString());
  }

  void createRows(int num) {
    List<PokemonContainer> containers = [];

    for (int i = 0; i < strings.length; i++) {
      containers.add(PokemonContainer(strings[i]));

      if (containers.length == num || i == strings.length - 1) {
        rows.add(Row(
          children: containers.toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ));
        containers.clear();
      }
    }
  }

  void init() {
    populate(1000);
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
