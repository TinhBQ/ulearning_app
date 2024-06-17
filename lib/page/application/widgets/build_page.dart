import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/page/home/home_page.dart';
import 'package:ulearning_app/page/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const Center(child: Text("Course")),
    const Center(child: Text("Course")),
    const Center(child: Text("Course")),
    const ProfilePage(),
  ];

  return widget[index];
}
