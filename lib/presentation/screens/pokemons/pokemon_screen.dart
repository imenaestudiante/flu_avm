import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonScreen extends StatelessWidget {
  final String id;

  const PokemonScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon $id'),
      ),
      body: Center(
        child: Text(
          'Datos del pokemon $id',
          style: GoogleFonts.russoOne(fontSize: 22),
        ),
      ),
    );
  }
}
