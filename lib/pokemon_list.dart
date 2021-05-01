import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'package:flutter_pokedex/pokemon_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Pokedex pokedex;

  Future<Pokedex> veri;

  Future<Pokedex> pokemonlariGetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            )),
      ),
      body: FutureBuilder(
        future: veri,
        // ignore: missing_return
        builder: (context, AsyncSnapshot<Pokedex> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PokemonDetail(
                                      pokemon: pokedex.pokemon[index],
                                    )));
                      },
                      child: Hero(
                        tag: pokedex.pokemon[index].img,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "assets/loadingNew.gif",
                                    image: pokedex.pokemon[index].img
                                        .replaceAll('http', 'https'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 12, right: 12, top: 8, bottom: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black38),
                                    child: Text(pokedex.pokemon[index].name,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        },
      ),
    );
  }
}
