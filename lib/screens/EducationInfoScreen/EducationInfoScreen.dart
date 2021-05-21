import 'package:flutter/material.dart';

class EducationInfoScreen extends StatefulWidget {
  @override
  _EducationInfoScreen createState() => _EducationInfoScreen();
}

class _EducationInfoScreen extends State<EducationInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Example Screen'),
            centerTitle: true,
          ),
          body: Container(),
        ),
      ),
    );
  }
}
