// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

IndianData welcomeFromJson(String str) => IndianData.fromJson(json.decode(str));

String welcomeToJson(IndianData data) => json.encode(data.toJson());

class IndianData {
  IndianData({
    this.casesTimeSeries,
    this.statewise,
    this.tested,
  });

  List<CasesTimeSery> casesTimeSeries;
  List<Statewise> statewise;
  List<Tested> tested;

  factory IndianData.fromJson(Map<String, dynamic> json) => IndianData(
        casesTimeSeries: List<CasesTimeSery>.from(
            json["cases_time_series"].map((x) => CasesTimeSery.fromJson(x))),
        statewise: List<Statewise>.from(
            json["statewise"].map((x) => Statewise.fromJson(x))),
        tested:
            List<Tested>.from(json["tested"].map((x) => Tested.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cases_time_series":
            List<dynamic>.from(casesTimeSeries.map((x) => x.toJson())),
        "statewise": List<dynamic>.from(statewise.map((x) => x.toJson())),
        "tested": List<dynamic>.from(tested.map((x) => x.toJson())),
      };
}

class CasesTimeSery {
  CasesTimeSery({
    this.dailyconfirmed,
    this.dailydeceased,
    this.dailyrecovered,
    this.date,
    this.dateymd,
    this.totalconfirmed,
    this.totaldeceased,
    this.totalrecovered,
  });

  String dailyconfirmed;
  String dailydeceased;
  String dailyrecovered;
  String date;
  DateTime dateymd;
  String totalconfirmed;
  String totaldeceased;
  String totalrecovered;

  factory CasesTimeSery.fromJson(Map<String, dynamic> json) => CasesTimeSery(
        dailyconfirmed: json["dailyconfirmed"],
        dailydeceased: json["dailydeceased"],
        dailyrecovered: json["dailyrecovered"],
        date: json["date"],
        dateymd: DateTime.parse(json["dateymd"]),
        totalconfirmed: json["totalconfirmed"],
        totaldeceased: json["totaldeceased"],
        totalrecovered: json["totalrecovered"],
      );

  Map<String, dynamic> toJson() => {
        "dailyconfirmed": dailyconfirmed,
        "dailydeceased": dailydeceased,
        "dailyrecovered": dailyrecovered,
        "date": date,
        "dateymd":
            "${dateymd.year.toString().padLeft(4, '0')}-${dateymd.month.toString().padLeft(2, '0')}-${dateymd.day.toString().padLeft(2, '0')}",
        "totalconfirmed": totalconfirmed,
        "totaldeceased": totaldeceased,
        "totalrecovered": totalrecovered,
      };
}

class Statewise {
  Statewise({
    this.active,
    this.confirmed,
    this.deaths,
    this.deltaconfirmed,
    this.deltadeaths,
    this.deltarecovered,
    this.lastupdatedtime,
    this.migratedother,
    this.recovered,
    this.state,
    this.statecode,
    this.statenotes,
  });

  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  factory Statewise.fromJson(Map<String, dynamic> json) => Statewise(
        active: json["active"],
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        deltaconfirmed: json["deltaconfirmed"],
        deltadeaths: json["deltadeaths"],
        deltarecovered: json["deltarecovered"],
        lastupdatedtime: json["lastupdatedtime"],
        migratedother: json["migratedother"],
        recovered: json["recovered"],
        state: json["state"],
        statecode: json["statecode"],
        statenotes: json["statenotes"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "confirmed": confirmed,
        "deaths": deaths,
        "deltaconfirmed": deltaconfirmed,
        "deltadeaths": deltadeaths,
        "deltarecovered": deltarecovered,
        "lastupdatedtime": lastupdatedtime,
        "migratedother": migratedother,
        "recovered": recovered,
        "state": state,
        "statecode": statecode,
        "statenotes": statenotes,
      };
}

class Tested {
  Tested({
    this.dailyrtpcrsamplescollectedicmrapplication,
    this.firstdoseadministered,
    this.frontlineworkersvaccinated1Stdose,
    this.frontlineworkersvaccinated2Nddose,
    this.healthcareworkersvaccinated1Stdose,
    this.healthcareworkersvaccinated2Nddose,
    this.over45Years1Stdose,
    this.over45Years2Nddose,
    this.over60Years1Stdose,
    this.over60Years2Nddose,
    this.positivecasesfromsamplesreported,
    this.registration1845Years,
    this.registrationabove45Years,
    this.registrationflwhcw,
    this.registrationonline,
    this.registrationonspot,
    this.samplereportedtoday,
    this.seconddoseadministered,
    this.source,
    this.source2,
    this.source3,
    this.source4,
    this.testedasof,
    this.testsconductedbyprivatelabs,
    this.to60YearswithcoMorbidities1Stdose,
    this.to60YearswithcoMorbidities2Nddose,
    this.totaldosesadministered,
    this.totaldosesavailablewithstates,
    this.totaldosesinpipeline,
    this.totaldosesprovidedtostatesuts,
    this.totalindividualsregistered,
    this.totalindividualstested,
    this.totalindividualsvaccinated,
    this.totalpositivecases,
    this.totalrtpcrsamplescollectedicmrapplication,
    this.totalsamplestested,
    this.totalsessionsconducted,
    this.totalvaccineconsumptionincludingwastage,
    this.updatetimestamp,
    this.years1Stdose,
    this.years2Nddose,
  });

  String dailyrtpcrsamplescollectedicmrapplication;
  String firstdoseadministered;
  String frontlineworkersvaccinated1Stdose;
  String frontlineworkersvaccinated2Nddose;
  String healthcareworkersvaccinated1Stdose;
  String healthcareworkersvaccinated2Nddose;
  String over45Years1Stdose;
  String over45Years2Nddose;
  String over60Years1Stdose;
  String over60Years2Nddose;
  String positivecasesfromsamplesreported;
  String registration1845Years;
  String registrationabove45Years;
  String registrationflwhcw;
  String registrationonline;
  String registrationonspot;
  String samplereportedtoday;
  String seconddoseadministered;
  String source;
  String source2;
  String source3;
  String source4;
  String testedasof;
  String testsconductedbyprivatelabs;
  String to60YearswithcoMorbidities1Stdose;
  String to60YearswithcoMorbidities2Nddose;
  String totaldosesadministered;
  String totaldosesavailablewithstates;
  String totaldosesinpipeline;
  String totaldosesprovidedtostatesuts;
  String totalindividualsregistered;
  String totalindividualstested;
  String totalindividualsvaccinated;
  String totalpositivecases;
  String totalrtpcrsamplescollectedicmrapplication;
  String totalsamplestested;
  String totalsessionsconducted;
  String totalvaccineconsumptionincludingwastage;
  String updatetimestamp;
  String years1Stdose;
  String years2Nddose;

  factory Tested.fromJson(Map<String, dynamic> json) => Tested(
        dailyrtpcrsamplescollectedicmrapplication:
            json["dailyrtpcrsamplescollectedicmrapplication"],
        firstdoseadministered: json["firstdoseadministered"],
        frontlineworkersvaccinated1Stdose:
            json["frontlineworkersvaccinated1stdose"],
        frontlineworkersvaccinated2Nddose:
            json["frontlineworkersvaccinated2nddose"],
        healthcareworkersvaccinated1Stdose:
            json["healthcareworkersvaccinated1stdose"],
        healthcareworkersvaccinated2Nddose:
            json["healthcareworkersvaccinated2nddose"],
        over45Years1Stdose: json["over45years1stdose"],
        over45Years2Nddose: json["over45years2nddose"],
        over60Years1Stdose: json["over60years1stdose"],
        over60Years2Nddose: json["over60years2nddose"],
        positivecasesfromsamplesreported:
            json["positivecasesfromsamplesreported"],
        registration1845Years: json["registration18-45years"],
        registrationabove45Years: json["registrationabove45years"],
        registrationflwhcw: json["registrationflwhcw"],
        registrationonline: json["registrationonline"],
        registrationonspot: json["registrationonspot"],
        samplereportedtoday: json["samplereportedtoday"],
        seconddoseadministered: json["seconddoseadministered"],
        source: json["source"],
        source2: json["source2"],
        source3: json["source3"],
        source4: json["source4"],
        testedasof: json["testedasof"],
        testsconductedbyprivatelabs: json["testsconductedbyprivatelabs"],
        to60YearswithcoMorbidities1Stdose:
            json["to60yearswithco-morbidities1stdose"],
        to60YearswithcoMorbidities2Nddose:
            json["to60yearswithco-morbidities2nddose"],
        totaldosesadministered: json["totaldosesadministered"],
        totaldosesavailablewithstates: json["totaldosesavailablewithstates"],
        totaldosesinpipeline: json["totaldosesinpipeline"],
        totaldosesprovidedtostatesuts: json["totaldosesprovidedtostatesuts"],
        totalindividualsregistered: json["totalindividualsregistered"],
        totalindividualstested: json["totalindividualstested"],
        totalindividualsvaccinated: json["totalindividualsvaccinated"],
        totalpositivecases: json["totalpositivecases"],
        totalrtpcrsamplescollectedicmrapplication:
            json["totalrtpcrsamplescollectedicmrapplication"],
        totalsamplestested: json["totalsamplestested"],
        totalsessionsconducted: json["totalsessionsconducted"],
        totalvaccineconsumptionincludingwastage:
            json["totalvaccineconsumptionincludingwastage"],
        updatetimestamp: json["updatetimestamp"],
        years1Stdose: json["years1stdose"],
        years2Nddose: json["years2nddose"],
      );

  Map<String, dynamic> toJson() => {
        "dailyrtpcrsamplescollectedicmrapplication":
            dailyrtpcrsamplescollectedicmrapplication,
        "firstdoseadministered": firstdoseadministered,
        "frontlineworkersvaccinated1stdose": frontlineworkersvaccinated1Stdose,
        "frontlineworkersvaccinated2nddose": frontlineworkersvaccinated2Nddose,
        "healthcareworkersvaccinated1stdose":
            healthcareworkersvaccinated1Stdose,
        "healthcareworkersvaccinated2nddose":
            healthcareworkersvaccinated2Nddose,
        "over45years1stdose": over45Years1Stdose,
        "over45years2nddose": over45Years2Nddose,
        "over60years1stdose": over60Years1Stdose,
        "over60years2nddose": over60Years2Nddose,
        "positivecasesfromsamplesreported": positivecasesfromsamplesreported,
        "registration18-45years": registration1845Years,
        "registrationabove45years": registrationabove45Years,
        "registrationflwhcw": registrationflwhcw,
        "registrationonline": registrationonline,
        "registrationonspot": registrationonspot,
        "samplereportedtoday": samplereportedtoday,
        "seconddoseadministered": seconddoseadministered,
        "source": source,
        "source2": source2,
        "source3": source3,
        "source4": source4,
        "testedasof": testedasof,
        "testsconductedbyprivatelabs": testsconductedbyprivatelabs,
        "to60yearswithco-morbidities1stdose": to60YearswithcoMorbidities1Stdose,
        "to60yearswithco-morbidities2nddose": to60YearswithcoMorbidities2Nddose,
        "totaldosesadministered": totaldosesadministered,
        "totaldosesavailablewithstates": totaldosesavailablewithstates,
        "totaldosesinpipeline": totaldosesinpipeline,
        "totaldosesprovidedtostatesuts": totaldosesprovidedtostatesuts,
        "totalindividualsregistered": totalindividualsregistered,
        "totalindividualstested": totalindividualstested,
        "totalindividualsvaccinated": totalindividualsvaccinated,
        "totalpositivecases": totalpositivecases,
        "totalrtpcrsamplescollectedicmrapplication":
            totalrtpcrsamplescollectedicmrapplication,
        "totalsamplestested": totalsamplestested,
        "totalsessionsconducted": totalsessionsconducted,
        "totalvaccineconsumptionincludingwastage":
            totalvaccineconsumptionincludingwastage,
        "updatetimestamp": updatetimestamp,
        "years1stdose": years1Stdose,
        "years2nddose": years2Nddose,
      };
}
