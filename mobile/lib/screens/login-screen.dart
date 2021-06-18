import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:foodybite_app/screens/home-screen.dart';
import 'package:foodybite_app/screens/screens.dart';
import 'package:foodybite_app/service/services.dart';
import 'package:foodybite_app/utils/Helpers.dart';
import 'package:foodybite_app/utils/storage.dart';
import 'package:foodybite_app/widgets/widgets.dart';

import 'create-new-account.dart';
import 'forgot-password.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _ncontroller = TextEditingController();
  TextEditingController _pcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    handleLogin() async {
      if (_ncontroller.text.length > 3 && _pcontroller.text.length >= 6) {
        var result = await Services().loginUser(
            {"email": _ncontroller.text, "password": _pcontroller.text});
        if (result['success']) {
          PreferenceUtils.setString("uinfo", jsonEncode(result));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (!result['success']) {
          Utils.showAlertDialog(context, "Wrong credientials",
              "Email and/or Password is/are wrong!");
        }
      } else {
        Utils.showAlertDialog(context, "Wrong credientials",
            "Email and Password field shouldn't be empty!");
      }
    }

    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Sweet Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    ctrl: _ncontroller,
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    ctrl: _pcontroller,
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword())),
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kBlue,
                    ),
                    child: TextButton(
                      onPressed: handleLogin,
                      child: Text(
                        "Login",
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNewAccount())),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
