import 'package:flutter/material.dart';

class PokemonContainer extends StatelessWidget {
  final String _sth;

  PokemonContainer(this._sth);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(_sth),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(30),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      ),
      onTap: () {
        print(_sth);
      },
    );
  }
}
