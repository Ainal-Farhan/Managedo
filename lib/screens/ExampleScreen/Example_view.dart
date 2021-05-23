import 'package:flutter/material.dart';

import '../view.dart';
import './Example_viewmodel.dart';

class ExampleView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => ExampleView());

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
          body: View<ExampleViewmodel>(
            initViewmodel: (viewmodel) => viewmodel,
            builder: (context, viewmodel, _) {
              return Card(
                child: Text('Example Screen'),
              );
            },
          ),
        ),
      ),
    );
  }
}
