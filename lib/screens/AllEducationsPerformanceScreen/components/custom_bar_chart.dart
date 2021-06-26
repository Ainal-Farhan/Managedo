import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:managedo_mobile_app/models/education.dart';

class CustomBarChart extends StatelessWidget {
  final charts.BarChart _barChart;
  final Education _education;

  CustomBarChart({barChart, education})
      : _barChart = barChart,
        _education = education;

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
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Arial',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${_education.universityName}\n',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: 'Degree Level: ${_education.degreeLevel}\n',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'CGPA:' +
                              _education.achievedCGPA.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
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
