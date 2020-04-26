import 'package:covid/CovidDataModel/CovidDataModel.dart';
import 'package:covid/Network/DataApiCall.dart';
import 'package:covid/global.dart';
import 'package:covid/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CovidDataModel covidDataList;
  Widget listViewWidget;
  bool isDataAvailable=false;
  CountryList countryDataList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    covidDataList= new CovidDataModel();
    countryDataList=new CountryList();
    getData();
  }
  @override
  Widget build(BuildContext context) {


    if(isDataAvailable) {
      listViewWidget = SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "COVID-19",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .apply(color: Colors.grey[500]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               Align(
                 child: Text(
                      "Tracker",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .apply(color: darkBlue, fontWeightDelta: 1),
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Last Updated",
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                    Text(
                      dateFormatter(DateTime.parse(covidDataList.date)),
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: darkGreen,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Global Case",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:numberFormatter(covidDataList.totalList.totalConfirmed),
                          style: Theme.of(context)
                              .textTheme
                              .display2
                              .apply(color: Colors.white, fontWeightDelta: 2),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:12.0,right: 8.0,bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.new_releases, color: Colors.grey[300]),
                        SizedBox(width: 5.0),
                        Text(
                          "New Confirmed : "+numberFormatter(covidDataList.totalList.newConfirmed),
                          style: TextStyle(color: Colors.grey[300]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Flexible(
//                        child: RaisedButton(
//                          padding: EdgeInsets.symmetric(
//                              horizontal: 15.0, vertical: 11.0),
//                          color: darkBlue,
//                          onPressed: () {},
//                          child: Text(
//                            'Deposit',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold),
//                          ),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: new BorderRadius.circular(9.0),
//                              side: BorderSide(color: Colors.white)),
//                        ),
//                      ),
//                      Flexible(
//                        child: RaisedButton(
//                          padding: EdgeInsets.symmetric(
//                              horizontal: 15.0, vertical: 11.0),
//                          color: darkBlue,
//                          onPressed: () {},
//                          child: Text(
//                            'Cash',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold),
//                          ),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: new BorderRadius.circular(9.0),
//                              side: BorderSide(color: Colors.white)),
//                        ),
//                      ),
//                      Flexible(
//                        child: RaisedButton(
//                          padding: EdgeInsets.symmetric(
//                              horizontal: 15.0, vertical: 11.0),
//                          color: lightBlue,
//                          onPressed: () {},
//                          child: Text(
//                            'Deposit',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold),
//                          ),
//                          shape: RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(9.0),
//                          ),
//                        ),
//                      ),
//                    ],
//                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(
                    color: Color(0x1a181818),
                    offset: Offset(5,1),
                    blurRadius: 25,
                    spreadRadius: 10
                ) ],
              ),
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,top: 15.0),
                      child: Text(
                        "Global Stats",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: darkBlue,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/3.5,
                          child: getAngleRadialBarChart(true,covidDataList)),
                    )
                  ],
                ),
              ),
            Divider(
              height: 10,
            ),
//            Row(
//              children: <Widget>[
//                Flexible(
//                  flex: 3,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        "BlockChain Analysis Report",
//                        style: Theme.of(context)
//                            .textTheme
//                            .title
//                            .apply(color: darkBlue, fontWeightDelta: 2),
//                      ),
//                      Text(
//                        "Created 20.10.2019",
//                        style: TextStyle(color: Colors.black.withOpacity(.71)),
//                      ),
//                      Text(
//                        "Originator: Cybdom Tech",
//                        style: TextStyle(color: Colors.black.withOpacity(.71)),
//                      ),
//                    ],
//                  ),
//                ),
//                Flexible(
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        "17.00 ETH",
//                        style: Theme.of(context).textTheme.title.apply(
//                            color: Color(0xff17dcb0), fontWeightDelta: 2),
//                        textAlign: TextAlign.center,
//                      ),
//                      RaisedButton(
//                        color: lightBlue,
//                        child: Text("View", style: TextStyle(color: Colors.white),),
//                        onPressed: () {
//                          Navigator.pushNamed(context, 'transaction');
//                        },
//                      )
//                    ],
//                  ),
//                )
//              ],
//            )
            Padding(
              padding: const EdgeInsets.only(left:8.0,top: 8.0),
              child: Text(
                  countryDataList.country,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              itemCount: transactions_stat.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
              ),
              itemBuilder: (ctx, id) {
                return StatesDetailContainer(i: id,countryList: countryDataList);
              },
            ),

          ],
        ),
      );
    }else{
      listViewWidget=Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: true,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      );

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: listViewWidget
    );
  }

  getData() async {
    covidDataList= (await getCovidGlobalData());
    print(covidDataList.toString());
    for(int i =0;i<covidDataList.countryList.length;i++){
      if(covidDataList.countryList[i].country=="India"){
        countryDataList=covidDataList.countryList[i];
      }
    }
    setState(() {
      isDataAvailable=true;
    });

  }

  // Date formatter
  String dateFormatter(DateTime date) {
    String formattedDate = DateFormat('MMM d, hh:mm aaa').format(date);
    return formattedDate;
  }

  String numberFormatter(int num){
    final formatter = new NumberFormat("#,##,###");
    return  formatter.format(num);

  }
}

SfCircularChart getAngleRadialBarChart(bool isTileView,CovidDataModel covDataList) {
  return SfCircularChart(
    title: ChartTitle(text: isTileView ? '' : 'Activity tracker'),
    legend: Legend(
        isVisible:  true,
        iconHeight: 20,
        iconWidth: 20,
        overflowMode: LegendItemOverflowMode.wrap),
    tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x'),
    series: getRadialBarSeries(isTileView,covDataList),
  );
}

List<RadialBarSeries<_RadialData, String>> getRadialBarSeries(bool isTileView,  CovidDataModel dataList) {
  final List<_RadialData> chartData = <_RadialData>[
    _RadialData('Confirmed ${(dataList.totalList.totalConfirmed~/dataList.totalList.newConfirmed).toInt()}%\n${dataList.totalList.newConfirmed}/${dataList.totalList.totalConfirmed}',(dataList.totalList.totalConfirmed~/dataList.totalList.newConfirmed).toInt(), 'Confirmed', null, const Color.fromRGBO(0, 201, 230, 1.0)),
    _RadialData('Death ${(dataList.totalList.totalDeaths~/dataList.totalList.newDeaths).toInt()}%\n${dataList.totalList.newDeaths}/${dataList.totalList.totalDeaths}', (dataList.totalList.totalDeaths~/dataList.totalList.newDeaths).toInt(), 'Death', null, const Color.fromRGBO(226, 1, 26, 1.0)),
    _RadialData('Recovered ${(dataList.totalList.totalRecovered~/dataList.totalList.newRecovered).toInt()}%\n${dataList.totalList.newRecovered}/${dataList.totalList.totalRecovered}', (dataList.totalList.totalRecovered~/dataList.totalList.newRecovered).toInt(), 'Recovered', null, const Color.fromRGBO(63, 224, 0, 1.0)),
  ];
  final List<RadialBarSeries<_RadialData, String>> list = <RadialBarSeries<_RadialData, String>>[
    RadialBarSeries<_RadialData, String>(
        pointRadiusMapper: (_RadialData data, _) => data.radius,

        maximumValue: 100,
        radius: '100%',
        gap: '2%',
        innerRadius: '30%',
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        xValueMapper: (_RadialData data, _) => data.xVal,
        yValueMapper: (_RadialData data, _) => data.yVal,
        pointColorMapper: (_RadialData data, _) => data.color,
        dataLabelMapper: (_RadialData data, _) => data.text,
        dataLabelSettings: DataLabelSettings(isVisible: true,textStyle: ChartTextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold)))
  ];
  return list;
}

class _RadialData {
  _RadialData(this.xVal, this.yVal, [this.text, this.radius, this.color]);
  final String xVal;
  final int yVal;
  final String text;
  final String radius;
  final Color color;
}
