import 'package:flutter/cupertino.dart';

class Day {
  Day(this.fullName, this.shortCut, this.selected);
  @required
  final String fullName;
  @required
  final String shortCut;
  bool selected;
}

List<Day> listDay = [
  Day('Monday', 'M', true),
  Day('Tuesday', 'T', true),
  Day('Wednesday', 'W', true),
  Day('Thursday', 'TH', false),
  Day('Friday', 'F', false),
  Day('Saturday', 'S', false),
  Day('Sunday', 'SU', false),
];
