import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_wiki/pokemon.dart';
import 'package:http/http.dart' as http;

import 'pokemon_listview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Wiki',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Pokemon Wikipedia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pokemon> pokemons = [];

  Future<void> fetchPokemon(String url) async {
    var url = "https://pokeapi.co/api/v2/pokemon/";
    var response = await http.get(url);
    pokemons.add(Pokemon.fromJSON(json.decode(response.body)));
  }

  void temp(http.Response response){
    Iterable l = json.decode(response.body)['results'];
    List<dynamic> urls = l.map((el) => el['url']).toList();
    urls.forEach((el) => fetchPokemon(el));
  }

  Future<void> fetchAllPokemons() {
    var url = "https://pokeapi.co/api/v2/pokemon/";
    http.get(url).then((response) => temp(response));

  }

  @override
  void initState()  {
    fetchAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
    print(pokemons);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PokemonListView(pokemons),
    );
  }
}
