import 'dart:convert';

import 'package:covid_tracker_2/models/apiModel.dart';
import 'package:covid_tracker_2/models/indianInfoModel.dart';
import 'package:http/http.dart' as http;

class APICalls {
  Future<Welcome> getAPI() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'useQueryString': 'true',
      'x-rapidapi-key': '2075dbb7c8msh3b689a34e6a8fa1p19674ejsn1b3f7e5a2b45',
      'x-rapidapi-host': 'covid-19-data.p.rapidapi.com',
    };
    var infoModel;

    try {
      var response = await http.get(
          Uri.parse('https://covid-19-data.p.rapidapi.com/totals'),
          headers: requestHeaders);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        infoModel = Welcome.fromJson(jsonMap[0]);
        return infoModel;
      }
    } catch (e) {
      print(e.toString());
      return infoModel;
    }
  }

  Future<List<Statewise>> getIndiainfo() async {
    Map<String, String> Requestheaders = {
      "x-rapidapi-key": "2075dbb7c8msh3b689a34e6a8fa1p19674ejsn1b3f7e5a2b45",
      "x-rapidapi-host": "covid-19-india-data-by-zt.p.rapidapi.com",
      "useQueryString": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    List<dynamic> result;
    List<Statewise> statewiseInfo;
    var response =
        await http.get(Uri.parse("https://api.covid19india.org/data.json"));
    var jsonMap = json.decode(response.body);
    result = jsonMap["statewise"];
    statewiseInfo = result.map((e) => Statewise.fromJson(e)).toList();
    // statewiseInfo.forEach((element) {
    //   print(element.active);
    // });
    return statewiseInfo;
  }
}
