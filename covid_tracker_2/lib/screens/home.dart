import 'package:flutter/material.dart';
import 'package:covid_tracker_2/widgets/countBox.dart';
import 'package:covid_tracker_2/network/api_calls.dart';
import 'package:covid_tracker_2/models/apiModel.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> _covidInfo;
  @override
  void initState() {
    _covidInfo = APICalls().getAPI();

    APICalls().getIndiainfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<Welcome>(
        future: _covidInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  var confirmed = snapshot.data.confirmed;
                  var recovered = snapshot.data.recovered;
                  var deaths = snapshot.data.deaths;
                  var active = confirmed - recovered - deaths;
                  var lastupdated =
                      DateFormat.yMMMd().format(snapshot.data.lastUpdate);
                  return Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.05,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.026),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                              ),
                            ],
                            image: DecorationImage(
                                image: AssetImage('assets/homepage.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Welcome to Covid-19 information portal',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),
                              ),
                            ),
                          )),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.045,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CountBox(
                                  colorbox: Colors.red[50],
                                  colorcount: Colors.red,
                                  colorhead: Colors.red[500],
                                  count: confirmed.toString(),
                                  head: 'Confirmed',
                                ),
                                CountBox(
                                  colorbox: Colors.blue[50],
                                  colorcount: Colors.blue,
                                  colorhead: Colors.blue[500],
                                  count: active.toString(),
                                  head: 'Active',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.045,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CountBox(
                                  colorbox: Colors.green[50],
                                  colorcount: Colors.green,
                                  colorhead: Colors.green[500],
                                  count: recovered.toString(),
                                  head: 'Recovered',
                                ),
                                CountBox(
                                  colorbox: Colors.grey[100],
                                  colorcount: Colors.grey,
                                  colorhead: Colors.grey[500],
                                  count: deaths.toString(),
                                  head: 'Deaths',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Last updated : ${lastupdated.toString()}',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[500]),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          )
                        ],
                      ),
                    ],
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
