import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_lernen/Point.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Point> list = [];

  @override
  void initState() {
    super.initState();

    var elem1 = Point(1, 1);
    var elem2 = Point(2, 2);
    var elem3 = Point(3, 3);
    var elem4 = Point(4, 5);
    var elem5 = Point(7, 7);

    list.add(elem1);
    list.add(elem2);
    list.add(elem3);
    list.add(elem4);
    list.add(elem5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Charts")),
        body: SizedBox(
          width: 500,
          child: ListView(
            children: [barChart(), scatterChart(), lineChart(), pieChart()],
          ),
        ));
  }

  Widget pieChart() {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: SizedBox(
          width: 500,
          height: 500,
          child: PieChart(
            PieChartData(centerSpaceRadius: 0, sections: [
              PieChartSectionData(value: 5, radius: 100),
              PieChartSectionData(value: 5, radius: 100),
              PieChartSectionData(value: 25, radius: 100)
            ]),
          )),
    );
  }

  Widget barChart() {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: SizedBox(
          width: 500,
          height: 500,
          child: BarChart(
            BarChartData(barGroups: [
              BarChartGroupData(barRods: [
                BarChartRodData(toY: 10),
                BarChartRodData(toY: 35),
                BarChartRodData(toY: 90)
              ], x: 10),
              BarChartGroupData(barRods: [
                BarChartRodData(toY: 10),
                BarChartRodData(toY: 35),
                BarChartRodData(toY: 90)
              ], x: 5)
            ]),
          )),
    );
  }

  Widget scatterChart() {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: SizedBox(
        width: 500,
        height: 500,
        child: ScatterChart(
          ScatterChartData(
              titlesData: const FlTitlesData(
                  topTitles: AxisTitles(), rightTitles: AxisTitles()),
              scatterSpots: [
                for (var elem in list)
                  ScatterSpot(elem.x, elem.y,
                      dotPainter: FlDotCirclePainter(radius: (elem.x * 5)))
              ]),
        ),
      ),
    );
  }

  Widget lineChart() {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: SizedBox(
        width: 500,
        height: 500,
        child: LineChart(
          LineChartData(
              titlesData: const FlTitlesData(
                  topTitles: AxisTitles(), rightTitles: AxisTitles()),
              lineBarsData: [
                LineChartBarData(
                  spots: list.map((point) => FlSpot(point.x, point.y)).toList(),
                ),
                LineChartBarData(
                  color: Colors.red,
                  spots: list.map((point) => FlSpot(point.y, point.x)).toList(),
                )
              ]),
        ),
      ),
    );
  }
}
