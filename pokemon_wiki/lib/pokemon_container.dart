import 'package:flutter/material.dart';
import 'package:pokemon_wiki/pokemon.dart';

class PokemonContainer extends StatelessWidget {
  final Pokemon pokemon;

  PokemonContainer(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(pokemon.name),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(30),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      ),
      onTap: () {
        print(pokemon.name);
      },
    );
  }
}
