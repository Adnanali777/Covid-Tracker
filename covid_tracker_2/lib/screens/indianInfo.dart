import 'package:covid_tracker_2/models/indianInfoModel.dart';
import 'package:covid_tracker_2/network/api_calls.dart';
import 'package:covid_tracker_2/widgets/countBox.dart';
import 'package:flutter/material.dart';

class India extends StatefulWidget {
  const India({Key key}) : super(key: key);

  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Statewise>>(
        future: APICalls().getIndiainfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var active = snapshot.data[index].active;
                  var recovered = snapshot.data[index].recovered;
                  var deaths = snapshot.data[index].deaths;
                  var confirmed = snapshot.data[index].confirmed;
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.05,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.026),
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8.0,
                            ),
                          ],
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          alignment: Alignment.center,
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
                                '${snapshot.data[index].state}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[800]),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                        ],
                      ),
                    ],
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
