import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/test/rest/rest_test.dart';

import './app/dependencies.dart' as dependency;
import './app/router.dart' as router;

void main() {
  dependency.init();

  // Testing the rest api (Get Request)
  RestTest().testGetRequest();

  runApp(
    MaterialApp(
      title: 'Managedo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: router.allScreenRoute,
      onGenerateRoute: router.createRoute,
    ),
  );
}
