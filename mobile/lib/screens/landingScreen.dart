import 'package:foodybite_app/widgets/glass.dart';
import 'package:foodybite_app/widgets/room_card/room_devices.dart';
import 'package:foodybite_app/widgets/room_card/room_status_log.dart';

import '../Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

import 'Fitness-App-HomeScreen.dart';

import '../pages/furniture.dart';

class LandingScreen extends StatefulWidget {
  final String image;

  const LandingScreen({Key key, this.image}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: 'red',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: FadeAnimation(
                    1,
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                1.3,
                                GContainer(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      const RoomDevices(),
                                      const RoomStatusLog()
                                    ],
                                  ),
                                )),
                            SizedBox(height: 10),
                            FadeAnimation(
                                1.3,
                                Text(
                                  "Livingroom",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 60,
                            ),
                            FadeAnimation(
                              1.5,
                              GestureDetector(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    'Check Now',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Furniture()));
                                },
                              ),
                            ),
                          ]),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
