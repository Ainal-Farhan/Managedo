import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/float.dart';
import 'package:managedo_mobile_app/screens/view.dart';
import './components/body.dart';

class SemesterDetailsView extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => SemesterDetailsView());

  @override
  SemesterDetailsState createState() => SemesterDetailsState();
}

class SemesterDetailsState extends State<SemesterDetailsView> {
  final List<int> data = [1, 2, 3, 4, 5];
  int _focusedIndex = 0;

  int get focusedIndex => _focusedIndex;

  void onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  void rebuildState() {
    return setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Semester & Courses Information'),
            centerTitle: true,
          ),
          body: View<SemesterDetailsViewmodel>(
            initViewmodel: (viewmodel) => viewmodel.init(),
            builder: (context, viewmodel, _) => Body(
              state: this,
              viewmodel: viewmodel,
            ),
          ),
          floatingActionButton: Float(),
        ),
      ),
    );
  }
}
