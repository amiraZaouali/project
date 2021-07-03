import 'package:flutter/material.dart';
import 'package:foodybite_app/widgets/home_background.dart';
import 'package:foodybite_app/widgets/home_backdrop_filter.dart';
import 'package:foodybite_app/widgets/rooms_list.dart';

class HomePage extends StatelessWidget {
  final String username;
  HomePage({this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          RoomsList(),
        ],
      ),
    ));
  }
}
