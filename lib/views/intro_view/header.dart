import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final Color color;
  const Header({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderText(
          text: 'Silent',
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.asset(
            'assets/icons/logoPNG.png',
            height: 25,
          ),
        ),
        HeaderText(
          text: 'Moon',
          color: color,
        ),
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  final Color color;
  const HeaderText({
    Key key,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          letterSpacing: 3,
          color: color == null ? Colors.black : color),
    );
  }
}
