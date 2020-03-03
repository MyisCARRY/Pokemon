import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pokemon.dart';

class Details extends StatelessWidget {
  final Pokemon pokemon;
  final double fontSize = 20;
  final List<Text> types = [];
  final List<Row> stats = [];
  final List<Text> abilities = [];

  Details({Key key, this.pokemon}) : super(key: key) {
    pokemon.types.forEach((el) {
      types.add(
        Text(
          el.name[0].toUpperCase() + el.name.substring(1),
          style: TextStyle(fontSize: fontSize),
        ),
      );
    });

    pokemon.stats.forEach((el) {
      stats.add(
        Row(
          children: [
            Text(
              el.name[0].toUpperCase() + el.name.substring(1),
              style: TextStyle(fontSize: fontSize),
            ),
            Text(
              el.baseStat.toString(),
              style: TextStyle(fontSize: fontSize),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );
    });

    abilities.add(
      Text(
        "Abilities",
        style: TextStyle(
          fontSize: fontSize + 6,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    pokemon.abilities.forEach((el) {
      abilities.add(
        Text(
          el.name[0].toUpperCase() + el.name.substring(1),
          style: TextStyle(fontSize: fontSize),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                style: GoogleFonts.lato(
                  fontSize: 46,
                ),
              ),
              Container(
                child: pokemon.sprite.img,
                width: 200,
              ),
              Container(
                child: Text(
                  "Id: " + pokemon.id.toString(),
                  style: TextStyle(fontSize: fontSize + 6),
                ),
                margin: EdgeInsets.only(
                  bottom: 15,
                ),
              ),
              Row(
                children: [
                  Text(
                    pokemon.height.toString() + " m",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  Column(
                    children: types,
                  ),
                  Text(
                    pokemon.weight.toString() + " kg",
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
          Container(
            child: Column(
              children: stats,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 25, right: 25, top: 8),
          ),
          Column(
            children: abilities,
          ),
        ],
      ),
    );
  }
}
