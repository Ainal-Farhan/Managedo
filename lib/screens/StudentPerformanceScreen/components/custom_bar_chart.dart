import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustomBarChart extends StatelessWidget {
  final charts.BarChart _barChart;

  CustomBarChart({barChart}) : _barChart = barChart;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.green,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Colors.black12,
            )),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: Text(
                    'Student\'s GPA for All Semester',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Georgia',
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: _barChart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
