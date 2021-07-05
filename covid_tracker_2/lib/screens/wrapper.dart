import 'package:covid_tracker_2/screens/home.dart';
import 'package:covid_tracker_2/screens/indianInfo.dart';
import 'package:covid_tracker_2/widgets/selectTab.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool selectval = SelectTab().isSelected;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.blueAccent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueAccent,
                ),
                tabs: [
                  Container(
                    width: 90,
                    height: 28,
                    child: Center(
                      child: Text(
                        "Global",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 28,
                    child: Center(
                      child: Text(
                        "India",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              India(),
            ],
          ),
        ));
  }
}
