import 'dart:convert';
import 'package:covid/CovidDataModel/CovidDataModel.dart';
import 'package:covid/global.dart';
import 'package:http/http.dart' as http;

Future<CovidDataModel> getCovidGlobalData() async {
  var list;
  CovidDataModel lisnt;
  var res = await http.get(Uri.encodeFull(BASE_URL), headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    lisnt = CovidDataModel.fromJson(jsonDecode(res.body));

    print("ListOne Size:$lisnt");

  }
  //print("List Size: ${lisnt.toString()}");
  return lisnt;
}
