import 'package:flutter/material.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'glass.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AfterReg extends StatefulWidget {
  final String username;
  AfterReg({Key key, this.username}) : super(key: key);

  @override
  _AfterRegState createState() => _AfterRegState();
}

class _AfterRegState extends State<AfterReg> {
  TextEditingController ctrl = TextEditingController();
  File image;
  int currentPage = 0;
  cameraConnect() async {
    print('Picker is Called');
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        image = img;
      });
    }
  }

  _onChangePage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  List rooms = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Hero(
                    tag: 'red',
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/living_room.jpg"),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 10,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Welcome, ${widget.username}",
                                style: TextStyle(fontSize: 50),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Add a room',
                                style: TextStyle(fontSize: 30),
                              ),
                              AnimatedContainer(
                                  curve: Curves.easeOutQuint,
                                  duration: const Duration(milliseconds: 300),
                                  child: Expanded(
                                    child: new Swiper(
                                      itemCount: 10,
                                      viewportFraction: 0.8,
                                      scale: 0.9,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          child: GContainer(
                                            child: image == null
                                                ? Icon(
                                                    Icons.add,
                                                    color: Colors.grey[200],
                                                    size: 250,
                                                  )
                                                : Expanded(
                                                    child: Column(
                                                        children: <Widget>[
                                                        SizedBox(height: 20),
                                                        Text(
                                                          ctrl.text,
                                                          style: TextStyle(
                                                              fontSize: 40),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Image.file(image)
                                                      ])),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.7,
                                          ),
                                          onTap: () {
                                            Alert(
                                              context: context,
                                              style: alertStyle,
                                              title: "Add room",
                                              content: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  inputTxt(
                                                      "Room name",
                                                      ctrl,
                                                      MediaQuery.of(context)
                                                          .size,
                                                      Icons.room),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await cameraConnect();
                                                    },
                                                    child: Container(
                                                      width: 300,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Colors.teal,
                                                            Colors.teal[400],
                                                          ],
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            offset:
                                                                Offset(5, 5),
                                                            blurRadius: 10,
                                                          )
                                                        ],
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                        Icons.add_a_photo,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              buttons: [
                                                DialogButton(
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  color: Colors.blueAccent,
                                                  radius: BorderRadius.circular(
                                                      10.0),
                                                ),
                                              ],
                                            ).show();
                                          },
                                        );
                                      },
                                    ),
                                  ))
                            ]))))));
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    titleStyle: TextStyle(
      color: Color.fromRGBO(91, 55, 185, 1.0),
    ),
  );
  Widget inputTxt(txt, ctrl, size, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            controller: ctrl,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: txt,
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}
