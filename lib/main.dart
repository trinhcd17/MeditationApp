import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/views/intro_view/intro_view.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatefulWidget {
  const RootApp({Key key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent),
      home: IntroView(),
    );
  }
}
