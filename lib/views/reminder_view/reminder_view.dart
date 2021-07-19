import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/components/rounded_button.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/models/day_models.dart';
import 'package:meditation_app/views/reminder_view/controller.dart';
import 'package:meditation_app/views/root_app/binding.dart';
import 'package:meditation_app/views/root_app/root_app.dart';

class ReminderView extends StatelessWidget {
  final _controller = Get.find<ReminderController>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var dateTime = DateTime.now();
    return Scaffold(
      body: Stack(
        children: [
          buildBody(screenSize, dateTime),
          backButton(function: () {
            Get.back();
          }),
        ],
      ),
    );
  }

  Column buildBody(Size screenSize, DateTime dateTime) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.2,
          padding: EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What time would you like to meditate?',
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Anytime you can choose but we recommend first thing in the morning.',
                style: TextStyle(
                    color: kTextSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        buildTimePicker(dateTime),
        Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.2,
          padding: EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Which day would you like to meditate?',
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Everyday is best, but we recommend picking at least five.',
                style: TextStyle(
                    color: kTextSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        buildListDay(),
        buildSaveButton(screenSize),
        buildNoButton(screenSize),
      ],
    );
  }

  Center buildNoButton(Size screenSize) {
    return Center(
      child: roundedButton(
        function: () {},
        text: 'No thanks',
        screenSize: screenSize,
        backgroundColor: Colors.transparent,
        textColor: kTextPrimaryColor,
      ),
    );
  }

  Center buildSaveButton(Size screenSize) {
    return Center(
      child: roundedButton(
        function: () {
          Get.off(() => RootApp(), binding: RootAppBinding());
        },
        text: 'Save',
        screenSize: screenSize,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,
      ),
    );
  }

  Widget buildListDay() {
    return GetBuilder<ReminderController>(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < listDay.length; i++)
            buildDayItem(listDay[i], i, _),
        ],
      );
    });
  }

  Widget buildTimePicker(DateTime dateTime) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: CupertinoDatePicker(
          onDateTimeChanged: (dateTime) {},
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          use24hFormat: false,
        ),
      ),
    );
  }

  Widget buildDayItem(Day day, int index, _) {
    return InkWell(
      onTap: () {
        _.selectDay(index);
      },
      child: day.selected == true
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kTextPrimaryColor,
              ),
              child: Center(
                child: Text(
                  day.shortCut,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  day.shortCut,
                  style: TextStyle(
                      color: kTextPrimaryColor, fontWeight: FontWeight.w700),
                ),
              ),
            ),
    );
  }
}
