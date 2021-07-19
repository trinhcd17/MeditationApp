import 'package:flutter/cupertino.dart';

class IconBottom {
  @required
  final String imageURL;
  @required
  final String text;
  final bool selected;

  IconBottom(this.imageURL, this.text, this.selected);
}

List<IconBottom> listIconBottom = [
  IconBottom('assets/icons/home_icon.svg', 'Home', true),
  IconBottom('assets/icons/sleep_icon.svg', 'Sleep', false),
  IconBottom('assets/icons/meditate_icon.svg', 'Meditate', false),
  IconBottom('assets/icons/music_icon.svg', 'Music', false),
  IconBottom('assets/icons/profile_icon.svg', 'Profile', false),
];
