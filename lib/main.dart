import 'package:flutter/material.dart';
import 'package:flutter_lyrics/main_tab_bar.dart';




void main()  {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AudioPlayer",
      home: MainTabBar(),

    );
  }
}
