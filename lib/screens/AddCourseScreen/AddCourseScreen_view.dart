import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/router.dart' as router;
//import 'package:managedo_mobile_app/models/course.dart';

//import 'components/bar.dart';
import '../view.dart';
import './AddCourseScreen_viewmodel.dart';

class AddCourseScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AddCourseScreen());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Add Course'),
            centerTitle: true,
          ),
          body: View<AddCourseScreenViewmodel>(
            initViewmodel: (viewmodel) => viewmodel,
            builder: (context, viewmodel, _) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                  onPressed: () => Navigator.of(context).pushReplacementNamed(
                    router.listSemestersRoute,
                  ),
                  isExtended: true,
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  ),
                  heroTag: null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
