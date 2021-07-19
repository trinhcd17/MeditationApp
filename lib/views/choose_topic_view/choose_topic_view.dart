import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:meditation_app/components/rounded_button.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/models/topic_models.dart';
import 'package:meditation_app/views/reminder_view/binding.dart';
import 'package:meditation_app/views/reminder_view/reminder_view.dart';

class ChooseTopicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Container(
                width: screenSize.width * 0.75,
                height: screenSize.height * 0.2,
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What brings you',
                      style: TextStyle(
                        color: kTextPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'to Silent Moon?',
                      style: TextStyle(
                          color: kTextPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Choose a topic to focus on:',
                      style: TextStyle(
                          color: kTextSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: listTopic.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildTopicItem(index: index),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2 : 1.7),
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                  ),
                ),
              ),
              Container(
                height: 66,
              )
            ],
          ),
          Positioned(
            bottom: 16.0,
            child: Container(
              width: screenSize.width,
              child: Center(
                child: roundedButton(
                  function: () {
                    Get.to(() => ReminderView(), binding: ReminderBinding());
                  },
                  text: 'Okay',
                  screenSize: screenSize,
                  backgroundColor: kPrimaryColor,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopicItem({int index}) {
    var topic = listTopic[index];
    return Container(
      decoration: BoxDecoration(
        color: topic.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Center(
              child: new Image.asset(topic.imageURL),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                child: Text(
                  topic.text,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: topic.textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
