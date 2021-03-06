import '../utils/constant.dart';
import '../widgets/furniture/bottomItem.dart';
import '../widgets/furniture/furniture_category.dart';
import '../widgets/furniture/item_navigation.dart';
import '../widgets/furniture/lamp.dart';
import '../widgets/title_large.dart';
import '../widgets/title_small.dart';
import 'package:flutter/material.dart';

class Furniture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            buildLampsWithSlider(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: TitleSmall(
                subTitle: 'In recent month',
                title: 'Popular',
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            BottomItem(),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    ));
  }

  Container buildLampsWithSlider() {
    return Container(
      //color: Colors.yellow,
      height: 300,
      child: Stack(
        children: <Widget>[
          buildLamps,
          // Positioned(
          //   bottom: 40.0,
          //   right: 50.0,
          //   child: ItemNavigation(),
          // )
        ],
      ),
    );
  }

  final buildLamps = ListView.builder(
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: lampList.length,
    itemBuilder: (context, int index) => Lamp(
      item: lampList[index],
      index: index,
    ),
  );
  final buildFurnitureCategories = Container(
    height: 100.0,
    //color: Colors.red,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: furnitureCategoriesList.length,
      itemBuilder: (context, int index) => FurnitureCategory(
        item: furnitureCategoriesList[index],
      ),
    ),
  );
}
