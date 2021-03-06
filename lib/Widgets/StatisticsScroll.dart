import 'package:flutter/material.dart';

class StatisticsScroll extends StatefulWidget {
  @override
  _StatisticsScrollState createState() => _StatisticsScrollState();
}

class _StatisticsScrollState extends State<StatisticsScroll> {
  int selectedIndex = 0;
  final List<String> categories = [
    'Braking Score',
    'Turning Score',
    'Parking Score',
    'Speed Score'
  ];
  final List<int> scores = [92, 68, 78, 85];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 224 / 640,
      color: Color.fromRGBO(31, 31, 31, 1.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.fromLTRB(35.0, 35.0, 0.0, 35.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 170.0,
                  height: MediaQuery.of(context).size.height * 125 / 600,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                          color: scores[index] < 70
                              ? Colors.red
                              : scores[index] < 80
                                  ? Colors.deepOrange
                                  : scores[index] < 90
                                      ? Colors.yellow
                                      : scores[index] < 101
                                          ? Colors.lightGreenAccent
                                          : Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 2.0),
                    ],
                    color: Color.fromRGBO(255, 251, 230, 1.0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 19.0,
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(0, 100, 175, 100),
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(fontSize: 6.3),
                      ),
                      Stack(
                        children: <Widget>[
                          Text(
                            scores[index].toString(),
                            style: TextStyle(
                                fontSize: 55.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 200, 255, 100)),
                          ),
                          Positioned(
                            bottom: 5,
                            right: -30,
                            child: Text(
                              '/100',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        overflow: Overflow.visible,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
