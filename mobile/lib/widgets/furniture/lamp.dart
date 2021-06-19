import 'package:flutter/cupertino.dart';

import '../../utils/constant.dart';
import '../../widgets/furniture/custom_side_button.dart';
import 'package:flutter/material.dart';

class Lamp extends StatelessWidget {
  final ProfileMenu item;
  final int index;
  Lamp({this.item, this.index});
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 350,
        //color: Colors.red,
        child: Container(
          margin: EdgeInsets.only(left: 25.0),
          //color: Colors.yellow,
          child: Stack(
            overflow: Overflow.visible,
            //fit: StackFit.passthrough,
            children: <Widget>[
              Container(
                height: 250.0,
                width: deviceSize.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    lampsImage[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 250.0,
                width: deviceSize.width * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE7E9EF).withOpacity(0.0),
                      Color(0xFFE7E9EF)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0.5, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Positioned(
                bottom: 40.0,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        // height: 110.0,
                        width: deviceSize.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          // color: Colors.white,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE7E9EF),
                              Colors.white30,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    item.subTitle,
                                    style: TextStyle(
                                      color: profile_info_background,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'USD',
                                      style: TextStyle(
                                        color: profile_info_background,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 20.0,
                        right: -20.0,
                        child: CupertinoSwitch(
                          value: true,
                          onChanged: (bool value) {},
                        )
                        //   CustomSideButton(
                        //     icon: Icons.arrow_forward,
                        //     fxn: () {
                        //       Navigator.pushNamed(
                        //         context,
                        //         '/selectedItem',
                        //         arguments: lampsImage[index]['image'],
                        //       );
                        //     },
                        //   ),
                        // ),
                        )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
