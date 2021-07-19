import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/models/meditate_category.dart';
import 'package:meditation_app/models/topic_models.dart';
import 'package:meditation_app/views/meditate_view/controller.dart';
import 'package:meditation_app/views/player_view/binding.dart';
import 'package:meditation_app/views/player_view/player_view.dart';

class MeditateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MeditateController controller = Get.find<MeditateController>();
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: screenSize.height * 0.05),
        buildHeaderText(screenSize),
        SizedBox(height: screenSize.height * 0.05),
        buildListCategory(),
        SizedBox(height: screenSize.height * 0.03),
        buildDailyThought(),
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
      ],
    );
  }

  SingleChildScrollView buildListCategory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GetBuilder<MeditateController>(builder: (_) {
        return Row(
          children: [
            SizedBox(
              width: 16.0,
            ),
            for (var i = 0; i < listCategory.length; i++)
              // buildCategoryItem(_, index: i),
              buildCategoryItem(i, _),
          ],
        );
      }),
    );
  }

  Widget buildCategoryItem(int i, MeditateController _) {
    var item = listCategory[i];
    bool selected = _.categoryIndex.value == i ? true : false;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          _.changeIndex(i);
        },
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                  color: selected == true ? kPrimaryColor : kTextSecondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: SvgPicture.asset(
                item.svgURL,
                color: Colors.white,
              ),
            ),
            Text(
              item.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selected == true
                      ? kTextPrimaryColor
                      : kTextSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderText(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      padding: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Meditate',
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'We can learn how to recognize when our minds are doing their normal everyday acrobatics.',
            style: TextStyle(
                color: kTextSecondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container buildDailyThought() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
            image: AssetImage('assets/images/daily_thought.png'),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Calm',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Meditation 3-10 min'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Get.to(
                    () => PlayerView(
                          title: 'Daily Thought',
                          description: '7 days of calm',
                        ),
                    binding: PlayerViewBinding());
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
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
