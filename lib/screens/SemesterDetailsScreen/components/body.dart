import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/courses/course_widget.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'semester/semester_details.dart';
import '../SemesterDetails_view.dart';

class Body extends StatelessWidget {
  final SemesterDetailsState _state;
  final SemesterDetailsViewmodel _viewmodel;

  Body({@required state, @required viewmodel})
      : _state = state,
        _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: SemesterDetails(
              state: _state,
              viewmodel: _viewmodel,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              'List of Courses',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: _viewmodel.courses != null && _viewmodel.courses.length > 0
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.36,
                    child: ScrollSnapList(
                      onItemFocus: (index) => {},
                      itemSize: 10,
                      itemBuilder: (context, index) => CourseWidget.buildListItem(
                        context,
                        index,
                        _viewmodel,
                        _state,
                      ),
                      itemCount: _viewmodel.courses.length,
                      reverse: true,
                      focusOnItemTap: true,
                    ),
                  )
                : Center(
                    child: Container(
                      child: Text('No Course Available'),
                    ),
                  ),
          ),
          Container(
            height: 80,
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                Text(
                  ' Semester Details',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
