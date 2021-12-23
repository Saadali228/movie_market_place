import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Color(0x99ff0000),
            Color(0x66ff0000),
            Color(0x66ff0000),
            Color(0x99ff0000),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(
            'Movie Mart',
            style: GoogleFonts.eczar(
              color: const Color(0xfff5f5f5),
              fontWeight: FontWeight.w600,
              fontSize: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}
