import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'BottomBarView.dart';
import 'Diary.dart';
import 'FitnessAppTheme.dart';
import 'TabIconData.dart';
import 'TrainingScreen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  static final String image = "lib/src/pages/dashboard/dash2.dart";
  final TextStyle whiteText = TextStyle(color: Colors.white);
  AnimationController animationController;
  bool _switcher = true;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = _buildBody();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return SafeArea(
                  child: Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              ));
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1 || index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}

_buildBody() {
  return CustomScrollView(
    slivers: <Widget>[
      _buildStats(),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildTitledContainer("Sales",
              child: Container(height: 200, child: LineChart(mainData())),
              color: Colors.blueGrey[900]),
        ),
      ),
      _buildActivities(),
    ],
  );
}

SliverPadding _buildStats() {
  final TextStyle stats = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white);

  bool _switcher = true;
  return SliverPadding(
    padding: const EdgeInsets.all(16.0),
    sliver: SliverGrid.count(
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      childAspectRatio: 1.5,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "+500",
                style: stats,
              ),
              const SizedBox(height: 5.0),
              Text("Leads".toUpperCase())
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.pink,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "+300",
                style: stats,
              ),
              const SizedBox(height: 5.0),
              Text("Customers".toUpperCase())
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.lightBlueAccent[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoSwitch(
                value: _switcher,
                onChanged: (bool value) {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
  SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildTitledContainer("Stats",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "+500",
                    style: stats,
                  ),
                  const SizedBox(height: 5.0),
                  Text("Leads".toUpperCase())
                ],
              ),
              const SizedBox(width: 20.0),
              const SizedBox(width: 20.0),
              Column(
                children: <Widget>[
                  Text(
                    "+600",
                    style: stats,
                  ),
                  const SizedBox(height: 5.0),
                  Text("Orders".toUpperCase())
                ],
              ),
              const SizedBox(width: 20.0),
              Column(
                children: <Widget>[
                  Text(
                    "+100",
                    style: stats,
                  ),
                  const SizedBox(height: 5.0),
                  Text("Deliveries".toUpperCase())
                ],
              ),
            ],
          ),
          color: Colors.blueAccent[200]),
    ),
  );
}

SliverPadding _buildActivities() {
  return SliverPadding(
    padding: const EdgeInsets.all(16.0),
    sliver: SliverToBoxAdapter(
      child: _buildTitledContainer("Activities",
          height: 280,
          child: Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: activities
                  .map(
                    (activity) => Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blueAccent,
                          child: activity.icon != null
                              ? Icon(
                                  activity.icon,
                                  size: 18.0,
                                )
                              : null,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          activity.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          color: Colors.tealAccent[100]),
    ),
  );
}

SliverToBoxAdapter _buildHeader() {
  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBFAcoYUKdmY1Zkr67auyU4KYNJfI9SRONDHkWmHVCOSDoKuyYfY74CkRiEDhRE_lUMdo&usqp=CAU";
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.0)),
            height: 200,
            foregroundDecoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20.0)),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Good Afternoon".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Take a glimpses at your dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.blue),
    titleSpacing: 0.0,
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: Text(
      "Dashboard",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
      textAlign: TextAlign.center,
    ),
    actions: <Widget>[_buildAvatar()],
  );
}

Widget _buildAvatar() {
  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBFAcoYUKdmY1Zkr67auyU4KYNJfI9SRONDHkWmHVCOSDoKuyYfY74CkRiEDhRE_lUMdo&usqp=CAU";
  return IconButton(
    iconSize: 40,
    padding: EdgeInsets.all(0),
    icon: CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      child: CircleAvatar(radius: 16, backgroundImage: NetworkImage(image)),
    ),
    onPressed: () {},
  );
}

Container _buildTitledContainer(String title,
    {Widget child, double height, Color color}) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: color,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.cyan[100]),
        ),
        if (child != null) ...[const SizedBox(height: 10.0), child]
      ],
    ),
  );
}

LineChartData mainData() {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff67727d),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}

/// Sample linear data type.
class LinearSales {
  final String month;
  final int sales;

  LinearSales(this.month, this.sales);
}

class Activity {
  final String title;
  final IconData icon;
  Activity({this.title, this.icon});
}

final List<Activity> activities = [
  Activity(title: "Results", icon: FontAwesomeIcons.listOl),
  Activity(title: "Messages", icon: FontAwesomeIcons.sms),
  Activity(title: "Appointments", icon: FontAwesomeIcons.calendarDay),
  Activity(title: "Video Consultation", icon: FontAwesomeIcons.video),
  Activity(title: "Summary", icon: FontAwesomeIcons.fileAlt),
  Activity(title: "Billing", icon: FontAwesomeIcons.dollarSign),
];
