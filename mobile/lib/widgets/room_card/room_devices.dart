import 'package:flutter/material.dart';
import 'package:foodybite_app/shared/styles.dart';

class RoomDevices extends StatelessWidget {
  const RoomDevices({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Text(
                "Details",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.lightbulb_outline,
                      size: 38.0, color: AppColors.primaryColor),
                  SizedBox(height: 5.0),
                  Text('Smart Lamp',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor)),
                  SizedBox(height: 4.0),
                  Text('ON',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor))
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset('assets/images/ac_icon.png',
                      width: 40.0, height: 38.0, color: AppColors.primaryColor),
                  SizedBox(height: 5.0),
                  Text('Air Conditioner',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor)),
                  SizedBox(height: 4.0),
                  Text('OFF',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor))
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.lock_open,
                      size: 38.0, color: AppColors.primaryColor),
                  SizedBox(height: 5.0),
                  Text('Unlock',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor)),
                ],
              ),
            ],
          ),
        ]));
  }
}
