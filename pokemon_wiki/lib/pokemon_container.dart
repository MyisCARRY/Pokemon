import 'package:flutter/material.dart';
import 'package:pokemon_wiki/detail_page.dart';
import 'package:pokemon_wiki/pokemon.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonContainer extends StatelessWidget {
  final Future<Pokemon> pokemon;

  PokemonContainer(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            child: ContainerBox(
                img: snapshot.data.sprite.img,
                text: snapshot.data.name[0].toUpperCase() +
                    snapshot.data.name.substring(1)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    pokemon: snapshot.data,
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return ContainerBox(
            img: Image.asset(
              "assets/error_icon.png",
              fit: BoxFit.fitWidth,
            ),
            text: "error",
          );
        }
        return ContainerBox(
          img: Image.asset("assets/default_photo.png"),
          text: "Ditto",
        );
      },
      future: pokemon,
    );
  }
}

class ContainerBox extends StatelessWidget {
  final Image img;
  final String text;

  ContainerBox({Key key, this.img, this.text}) : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width -= 70;
    width /= 3;
    return Container(
      child: Column(
        children: [
          img,
          Text(
            text,
            style: GoogleFonts.lato(),
          ),
        ],
      ),
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xfff5f6fa),
        boxShadow: [
          BoxShadow(
            color: Color(0xffdcdde1),
            blurRadius: 4.0,
            // has the effect of softening the shadow
            spreadRadius: 2.0,
            // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              0, // vertical, move down 10
            ),
          )
        ],
      ),
      width: width,
    );
  }
}
