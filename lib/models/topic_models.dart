import 'package:flutter/material.dart';
import 'package:meditation_app/constants/constants.dart';

class Topic {
  @required
  final String text;
  @required
  final Color backgroundColor;
  @required
  final Color textColor;
  @required
  final String imageURL;

  Topic(this.text, this.backgroundColor, this.textColor, this.imageURL);
}

List<Topic> listTopic = [
  Topic('Reduce Stress', Color.fromRGBO(142, 151, 253, 1), Colors.white,
      'assets/images/stress_CT.png'),
  Topic('Improve Performance', Color.fromRGBO(250, 110, 90, 1), Colors.white,
      'assets/images/performance_CT.png'),
  Topic('Increase Happiness', Color.fromRGBO(254, 177, 143, 1),
      kTextPrimaryColor, 'assets/images/happiness_CT.png'),
  Topic('Reduce Anxiety', Color.fromRGBO(255, 207, 134, 1), kTextPrimaryColor,
      'assets/images/anxiety_CT.png'),
  Topic('Personal Growth', Color.fromRGBO(108, 178, 142, 1), Colors.white,
      'assets/images/grown_CT.png'),
  Topic('Better Sleep', Color.fromRGBO(63, 65, 78, 1), Colors.white,
      'assets/images/sleep_CT.png'),
  Topic('Better Study', Color.fromRGBO(117, 131, 202, 1), kTextPrimaryColor,
      'assets/images/study_CT.png'),
  Topic('Better Work', Color.fromRGBO(217, 165, 181, 1), kTextPrimaryColor,
      'assets/images/work_CT.png'),
];
