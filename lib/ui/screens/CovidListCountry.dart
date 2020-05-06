import 'package:covid/CovidDataModel/CovidDataModel.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class CovidListCountry extends StatefulWidget {

  CovidDataModel _countryList;
  CovidListCountry(this._countryList);
  @override
  _CovidListCountryState createState() => _CovidListCountryState();
}

class _CovidListCountryState extends State<CovidListCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,color: Colors.black,size: 30.0,), onPressed: (){
          Navigator.of(context).pop();
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.help_outline,color: Colors.black,), onPressed: (){
            _launchURL();
          }),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: widget._countryList.countryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                    color: Color(0x1a181818),
                    offset: Offset(0,5),
                    blurRadius: 25,
                    spreadRadius: 5
              ) ],
            ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                       leading:  Container(
                         margin: EdgeInsets.all(2),
                         color: Colors.white,
                         child:  Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(widget._countryList.countryList[index].country.toString(),
                             style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),
                           ),
                         ),
                       ),
                       trailing: Flags.getFlag(country:widget._countryList.countryList[index].countryCode, height: 50, width: 50),
                     ),
                   ),
                 ),
               ),
              ],
            );
          }
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
