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
                image: AssetImage(widget.image),
                fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 10,
                  offset: Offset(0, 10)
                )
              ]
            ),
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
                          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: Center(                        child: Icon(Icons.favorite_border, size: 20,),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: FadeAnimation(1, Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.0),
                        ]
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FadeAnimation(1.3, Text("Livingroom", style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 25,),
                        FadeAnimation(1.4, Text("pawer", style: TextStyle(color: Colors.white, fontSize: 20),)),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            FadeAnimation(1.5, Container(
                              width: 60,
                              height: 40,
                              margin: EdgeInsets.only(right: 20),
                              child: Center(
                                child: Text('TV', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                              ),
                            )),
                            FadeAnimation(1.45, Container(
                              width: 61,
                              height: 40,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text('Air conditioner', style: TextStyle(fontWeight: FontWeight.bold),)
                              ),
                            )),
                            FadeAnimation(1.46, Container(
                              width: 60,
                              height: 40,
                              margin: EdgeInsets.only(right: 20),
                              child: Center(
                                child: Text('Washing Machine', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                              ),
                            )),
                            FadeAnimation(1.47, Container(
                              width: 60,
                              height: 40,
                              margin: EdgeInsets.only(right: 20),
                              child: Center(
                                child: Text('Electric Oven', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 60,),
                        FadeAnimation(1.5, Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                       child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Furniture()));
                          },
                          child: Center(
                            child: Text('Check Now', style: TextStyle(fontWeight: FontWeight.bold),)  
                          ),
                          ),
                        ),
                      ),
              ]),
                  )),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}