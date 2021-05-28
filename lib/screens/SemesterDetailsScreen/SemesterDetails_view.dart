import 'package:flutter/material.dart';

class SemesterDetailsView extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => SemesterDetailsView());

  @override
  SemesterDetailsState createState() => SemesterDetailsState();
}

class SemesterDetailsState extends State<SemesterDetailsView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Container(),
    );
  }
}
