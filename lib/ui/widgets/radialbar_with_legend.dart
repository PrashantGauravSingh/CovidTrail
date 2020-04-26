import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RadialBarAngle extends StatefulWidget {
  const RadialBarAngle({Key key}) : super(key: key);

  @override
  _RadialBarAngleState createState() => _RadialBarAngleState();
}

class _RadialBarAngleState extends State<RadialBarAngle> {
  bool panelOpen;
  final ValueNotifier<bool> frontPanelVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    panelOpen = frontPanelVisible.value;
    frontPanelVisible.addListener(_subscribeToValueNotifier);
    super.initState();
  }

  void _subscribeToValueNotifier() => panelOpen = frontPanelVisible.value;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(RadialBarAngle oldWidget) {
    super.didUpdateWidget(oldWidget);
    frontPanelVisible.removeListener(_subscribeToValueNotifier);
    frontPanelVisible.addListener(_subscribeToValueNotifier);
  }

  @override
  Widget build(BuildContext context) {
    return FrontPanel();
  }
}

class FrontPanel extends StatefulWidget {
  //ignore:prefer_const_constructors_in_immutables
  FrontPanel();

  @override
  _FrontPanelState createState() => _FrontPanelState();
}

class _FrontPanelState extends State<FrontPanel> {
  _FrontPanelState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
            child: Container(child: getAngleRadialBarChart(false)),
          ));
  }
}


SfCircularChart getAngleRadialBarChart(bool isTileView) {
  return SfCircularChart(
    title: ChartTitle(text: isTileView ? '' : 'Activity tracker'),
    legend: Legend(
        isVisible:  true,
        iconHeight: 20,
        iconWidth: 20,
        overflowMode: LegendItemOverflowMode.wrap),
    tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x'),
    series: getRadialBarSeries(isTileView),
  );
}

List<RadialBarSeries<_RadialData, String>> getRadialBarSeries(bool isTileView) {
  final List<_RadialData> chartData = <_RadialData>[
    _RadialData('Move 65%\n338/520 CAL', 65, 'Move  ', null,
        const Color.fromRGBO(0, 201, 230, 1.0)),
    _RadialData('Exercise 43%\n13/30 MIN', 43, 'Exercise  ', null,
        const Color.fromRGBO(63, 224, 0, 1.0)),
    _RadialData('Stand 58%\n7/12 HR', 58, 'Stand  ', null,
        const Color.fromRGBO(226, 1, 26, 1.0)),
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
        dataLabelSettings: DataLabelSettings(isVisible: true))
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
