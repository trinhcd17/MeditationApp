import 'package:flutter/material.dart';

class MeditateCategory {
  final String svgURL;
  final String title;

  MeditateCategory({@required this.svgURL, @required this.title});
}

List<MeditateCategory> listCategory = [
  MeditateCategory(svgURL: 'assets/icons/all_icon.svg', title: 'All'),
  MeditateCategory(svgURL: 'assets/icons/heart_no_fill.svg', title: 'My'),
  MeditateCategory(svgURL: 'assets/icons/sad_icon.svg', title: 'Anxious'),
  MeditateCategory(svgURL: 'assets/icons/sleep2_icon.svg', title: 'Sleep'),
  MeditateCategory(svgURL: 'assets/icons/kid_icon.svg', title: 'Kids'),
  MeditateCategory(svgURL: 'assets/icons/relax_icon.svg', title: 'Relax'),
  MeditateCategory(svgURL: 'assets/icons/study_icon.svg', title: 'Study'),
  MeditateCategory(svgURL: 'assets/icons/cook_icon.svg', title: 'Cook'),
];
