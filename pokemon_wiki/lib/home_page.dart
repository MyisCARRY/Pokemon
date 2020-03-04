import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokemon_wiki/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_wiki/pokemon_listview.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget{
  final String title;
  final int count = 964;
  final searchController = TextEditingController();
  final List<Future<Pokemon>> pokemons = [];

  HomePage({Key key, this.title,}) : super(key: key);

  Future<List<Future<Pokemon>>> fetchAllPokemons() async {
    pokemons.clear();

    var url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=$count";
    var response = await http.get(url);
    var result = json.decode(response.body)['results'];
    List<dynamic> urls = result.map((el) => el['url']).toList();

    urls.forEach((el) {
      pokemons.add(fetchPokemon(el));
    });

    return pokemons;
  }

  Future<Pokemon> fetchPokemon(String url) async {
    var response = await http.get(url);
    var result = json.decode(response.body);
    return Pokemon.fromJSON(result);
  }

  void searchPokemon(context) {
    var text = searchController.text;
    if (text != null && text.length > 0) {
      var url = "https://pokeapi.co/api/v2/pokemon/" + text;

      try {
        fetchPokemon(url).then((it) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              pokemon: it,
            ),
          ),
        ));
      } catch (e) {
        print("ERROR: " + e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Future<Pokemon>>>(
        future: fetchAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Color(0xffced6e0),
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Color(0xffced6e0),
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Color(0xffced6e0),
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Search',
                      suffixIcon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border(
                            left: BorderSide(
                              width: 1.0,
                              color: Color(0xffced6e0),
                            ),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () => searchPokemon(context),
                        ),
                      ),
                    ),
                  ),
                  margin:
                  EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 0),
                ),
                Expanded(
                  child: PokemonListView(snapshot.data),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Container(
                child: Text("Problem with connection"),
                alignment: Alignment(0.0, 0.0),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

}

//class HomePage extends StatefulWidget {
//  final String title;
//
//  const HomePage({Key key, this.title}) : super(key: key);
//
//  @override
//  State<StatefulWidget> createState() {
//    return _HomePageState();
//  }
//}
//
//class _HomePageState extends State<HomePage> {
//  int count = 964;
//  final searchController = TextEditingController();
//
////  int offset = 0;
////  int itemsPerPage = 20;
////  int page = 0;
////  int maxPage;
//  List<Future<Pokemon>> pokemons = [];
//
//  Future<List<Future<Pokemon>>> fetchAllPokemons() async {
//    pokemons.clear();
//
//    var url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=$count";
//    var response = await http.get(url);
//    var result = json.decode(response.body)['results'];
//    List<dynamic> urls = result.map((el) => el['url']).toList();
//
//    urls.forEach((el) {
//      pokemons.add(fetchPokemon(el));
//    });
//
//    return pokemons;
//  }
//
//  Future<Pokemon> fetchPokemon(String url) async {
//    var response = await http.get(url);
//    var result = json.decode(response.body);
//    return Pokemon.fromJSON(result);
//  }
//
//  void searchPokemon() {
//    var text = searchController.text;
//    if (text != null && text.length > 0) {
//      var url = "https://pokeapi.co/api/v2/pokemon/" + text;
//
//      try {
//        fetchPokemon(url).then((it) => Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) => Details(
//                  pokemon: it,
//                ),
//              ),
//            ));
//      } catch (e) {
//        print("ERROR: " + e);
//      }
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    //maxPage = (count / itemsPerPage).ceil();
//    return Scaffold(
//      body: FutureBuilder<List<Future<Pokemon>>>(
//        future: fetchAllPokemons(),
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            return Column(
//              children: [
//                Container(
//                  child: TextField(
//                    controller: searchController,
//                    decoration: InputDecoration(
//                      focusedBorder: OutlineInputBorder(
//                        gapPadding: 0.0,
//                        borderRadius: BorderRadius.circular(30.0),
//                        borderSide: BorderSide(
//                          color: Color(0xffced6e0),
//                          width: 1.0,
//                        ),
//                      ),
//                      enabledBorder: OutlineInputBorder(
//                        gapPadding: 0.0,
//                        borderRadius: BorderRadius.circular(30.0),
//                        borderSide: BorderSide(
//                          color: Color(0xffced6e0),
//                          width: 1.0,
//                        ),
//                      ),
//                      border: OutlineInputBorder(
//                        gapPadding: 0.0,
//                        borderRadius: BorderRadius.circular(30.0),
//                        borderSide: BorderSide(
//                          color: Color(0xffced6e0),
//                          width: 1.0,
//                        ),
//                      ),
//                      hintText: 'Search',
//                      suffixIcon: Container(
//                        decoration: BoxDecoration(
//                          shape: BoxShape.rectangle,
//                          border: Border(
//                            left: BorderSide(
//                              width: 1.0,
//                              color: Color(0xffced6e0),
//                            ),
//                          ),
//                        ),
//                        child: IconButton(
//                          icon: Icon(
//                            Icons.search,
//                            color: Colors.grey,
//                          ),
//                          onPressed: searchPokemon,
//                        ),
//                      ),
//                    ),
//                  ),
//                  margin:
//                      EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 0),
//                ),
//                Expanded(
//                  child: PokemonListView(snapshot.data),
//                ),
//              ],
//            );
//          } else if (snapshot.hasError) {
//            return Center(
//              child: Container(
//                child: Text("Problem with connection"),
//                alignment: Alignment(0.0, 0.0),
//              ),
//            );
//          }
//          return CircularProgressIndicator();
//        },
//      ),
//    );
//  }
//}
