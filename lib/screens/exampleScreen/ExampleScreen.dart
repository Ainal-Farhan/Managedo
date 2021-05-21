import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreen createState() => _ExampleScreen();
}

class _ExampleScreen extends State<ExampleScreen> {
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
