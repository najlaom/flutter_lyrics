import 'package:flutter/material.dart';
import 'package:flutter_lyrics/screens/home.dart';
class MainTabBar extends StatefulWidget{
  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> with SingleTickerProviderStateMixin {
  TabController controller;
  
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: Center(
          child: Text("PLAYLIST"),
        ),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.playlist_play),
            Icon(Icons.replay_5),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Home(),
          Container(color: Colors.blueAccent,),
          Container(color: Colors.grey,),
          Container(color: Colors.yellowAccent,),
        ],
      ),
    );
  }
}