import 'package:flutter/material.dart';

class RecommendModels {
  @required
  final String imageURL;
  @required
  final String title;
  @required
  final Color backgroundColor;

  RecommendModels({this.imageURL, this.title, this.backgroundColor});
}

List<RecommendModels> listRecommend = [
  RecommendModels(
    imageURL: 'assets/images/focus_recommend.png',
    title: 'Focus',
    backgroundColor: Color.fromRGBO(175, 219, 197, 1),
  ),
  RecommendModels(
    imageURL: 'assets/images/happiness_recommend.png',
    title: 'Happiness',
    backgroundColor: Color.fromRGBO(254, 222, 165, 1),
  ),
];
