import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.pokemon.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            )),
      ),
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * (0.73),
            width: MediaQuery.of(context).size.width - 20,
            top: MediaQuery.of(context).size.height * 0.1,
            left: 10,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black38),
                    child: Text(
                      widget.pokemon.name,
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Poke-height: ${widget.pokemon.height}",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Poke-weight: ${widget.pokemon.weight}",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "- Types -",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) => Chip(
                              elevation: 6,
                              shadowColor: Colors.white,
                              backgroundColor: Colors.black38,
                              label: Text(
                                tip,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "- Pre-Evolutions -",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null
                        ? widget.pokemon.prevEvolution
                            .map((prevo) => Chip(
                                  elevation: 6,
                                  shadowColor: Colors.white,
                                  backgroundColor: Colors.black38,
                                  label: Text(
                                    prevo.name,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                            .toList()
                        : [
                            Container(
                              child: Text(
                                "This is the first evolution.",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.teal,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                color: Colors.black38,
                              ),
                              padding: EdgeInsets.all(8),
                            ),
                          ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "- Next Evolutions -",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null
                        ? widget.pokemon.nextEvolution
                            .map((evolution) => Chip(
                                  shadowColor: Colors.white,
                                  elevation: 6,
                                  backgroundColor: Colors.black38,
                                  label: Text(
                                    evolution.name,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                            .toList()
                        : [
                            Container(
                              child: Text(
                                "This is the final evolution.",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.teal,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                color: Colors.black38,
                              ),
                              padding: EdgeInsets.all(8),
                            )
                          ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "- Weaknesses -",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses
                            .map((wness) => Chip(
                                  elevation: 6,
                                  shadowColor: Colors.white,
                                  backgroundColor: Colors.black38,
                                  label: Text(
                                    wness,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                            .toList()
                        : [
                            Text("There is no weakness.",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.teal,
                                ))
                          ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                height: 200,
                width: 200,
                child: Image.network(
                  widget.pokemon.img,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
