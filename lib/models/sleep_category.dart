import 'package:flutter/cupertino.dart';

class SleepCategory {
  @required
  final String title;
  @required
  final String imageURL;

  SleepCategory({this.title, this.imageURL});
}

List<SleepCategory> listSleepCategory = [
  SleepCategory(title: 'Night Island', imageURL: 'assets/images/sleep1.png'),
  SleepCategory(title: 'Sweet Sleep', imageURL: 'assets/images/sleep2.png'),
  SleepCategory(title: 'Good night', imageURL: 'assets/images/sleep3.png'),
  SleepCategory(title: 'Moon Clouds', imageURL: 'assets/images/sleep4.png'),
];
