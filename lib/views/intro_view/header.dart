import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderText(
          text: 'Silent',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.asset(
            'assets/icons/logoPNG.png',
            height: 25,
          ),
        ),
        HeaderText(text: 'Moon'),
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 3),
    );
  }
}
