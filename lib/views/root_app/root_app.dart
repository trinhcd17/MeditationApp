import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/models/icon_bottom.dart';
import 'package:meditation_app/views/home_view/home_view.dart';
import 'package:meditation_app/views/meditate_view/meditate_view.dart';
import 'package:meditation_app/views/music_view/music_view.dart';
import 'package:meditation_app/views/profile_view/profile_view.dart';
import 'package:meditation_app/views/root_app/controller.dart';
import 'package:meditation_app/views/sleep_view/sleep_view.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  var _controller = Get.find<RootAppController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> _tabs = [
      HomeView(),
      SleepView(),
      MeditateView(),
      MusicView(),
      ProfileView(),
    ];

    return GetBuilder<RootAppController>(builder: (_) {
      return Scaffold(
        body: IndexedStack(
          index: _.index.value,
          children: _tabs,
        ),
        bottomNavigationBar: buildBottom(_),
      );
    });
  }

  Widget buildBottom(_) {
    return Container(
      color: _.darkMode.value ? kDarkColor : Colors.white,
      child: SafeArea(
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < listIconBottom.length; i++)
                buildIconBottom(listIconBottom[i], i, _),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconBottom(IconBottom icon, int index, _) {
    return InkWell(
      onTap: () {
        _.changeIndex(index);
        if (index == 1) {
          _.showDarkMode(true);
        } else {
          _.showDarkMode(false);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _.index == index
                  ? kPrimaryColor
                  : _.darkMode == true
                      ? kDarkColor
                      : Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: SvgPicture.asset(
              icon.imageURL,
              color: _.index == index ? Colors.white : null,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            icon.text,
            style: TextStyle(
                color: _.index == index
                    ? _.darkMode == true
                        ? Colors.white
                        : kPrimaryColor
                    : kTextSecondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
