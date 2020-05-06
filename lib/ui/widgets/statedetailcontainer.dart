import 'package:covid/CovidDataModel/CovidDataModel.dart';
import 'package:covid/global.dart';
import 'package:flutter/material.dart';

class StatesDetailContainer extends StatelessWidget {
  final int i;
  final CountryList countryList;

  const StatesDetailContainer({
    Key key, this.i, this.countryList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: transactions_stat[i]['border'] ?? Border(),
          borderRadius: BorderRadius.circular(15.0),
          color: transactions_stat[i]['color'],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Confirmed",
                  style: TextStyle(
                    fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: transactions_stat[i]['text_color']),
                  ),
              )
              ),
            Expanded(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_upward,color: Colors.white,size: 15,),
                  Center(
                    child: Text(
                      "[${countryList.newConfirmed}]",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: transactions_stat[i]['text_color']),
                    ),
                  ),
                ],
              )
            ),
            Expanded(
              child: Center(
                child: Text(
                  "${countryList.totalConfirmed}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: transactions_stat[i]['text_color'],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (i == 2) {
      return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: transactions_stat[i]['border'] ?? Border(),
          borderRadius: BorderRadius.circular(15.0),
          color: transactions_stat[i]['color'],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Center(
                  child: Text(
                    "Death",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: transactions_stat[i]['text_color']),
                  ),
                )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_upward,color: Colors.white,size: 15,),
                  Center(
                    child: Text(
                      "[${countryList.newDeaths}]",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: transactions_stat[i]['text_color'],
                      ),
                    ),
                  ),
                ],
              )
            ),
            Expanded(
              child: Center(
                child: Text(
                  "${countryList.totalDeaths}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: transactions_stat[i]['text_color'],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if(i==1){
      return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: transactions_stat[i]['border'] ?? Border(),
          borderRadius: BorderRadius.circular(15.0),
          color: transactions_stat[i]['color'],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Center(
                  child: Text(
                    "Recovered",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: transactions_stat[i]['text_color']),
                  ),
                )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_upward,color: Colors.white,size: 15,),
                  Center(
                    child: Text(
                      "[${countryList.newRecovered}]",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: transactions_stat[i]['text_color']),
                    ),
                  ),
                ],
              )
            ),
            Expanded(
              child: Center(
                child: Text(
                  "${countryList.totalRecovered}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: transactions_stat[i]['text_color'],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}