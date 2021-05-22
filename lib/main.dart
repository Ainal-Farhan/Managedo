import 'package:flutter/material.dart';

import './app/dependencies.dart' as dependency;
import './app/router.dart' as router;

void main() {
  dependency.init();

  runApp(
    MaterialApp(
      title: 'Managedo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: router.educationRoute,
      onGenerateRoute: router.createRoute,
    ),
  );
}
