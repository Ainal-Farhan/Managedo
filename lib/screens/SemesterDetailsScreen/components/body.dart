import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/custom_course_list_tile.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/edit_course.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import './semester_details.dart';
import '../SemesterDetails_view.dart';

class Body extends StatelessWidget {
  final SemesterDetailsState _state;
  final SemesterDetailsViewmodel _viewmodel;

  Body({@required state, @required viewmodel})
      : _state = state,
        _viewmodel = viewmodel;

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
            margin: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.white,
                  Colors.green,
                  Colors.white,
                  Colors.green,
                ],
              ),
            ),
            child: Card(
              color: Color.fromRGBO(0, 0, 0, 0),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(0),
                        height: 30,
                        width: 30,
                        child: Center(
                          child: IconButton(
                            iconSize: 25,
                            icon: Icon(Icons.delete_forever_outlined),
                            onPressed: () => _showAlert(context),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomCourseListTile(
                    label: 'Course Code',
                    details:
                        _viewmodel.courseList[index].courseCode.toUpperCase(),
                    onPressed: () async => await EditCourse.editCourseCode(
                      context: context,
                      currentValue: _viewmodel.courseList[index].courseCode,
                    ).then(
                      (value) {
                        if (value != null) {
                          _viewmodel.courseList[index].courseCode = value;
                          _state.rebuildState();
                        }
                      },
                    ),
                  ),
                  CustomCourseListTile(
                    label: 'Course Name',
                    details: _viewmodel.courseList[index].courseName,
                    onPressed: () async => await EditCourse.editCourseName(
                      context: context,
                      currentValue: _viewmodel.courseList[index].courseName,
                    ).then(
                      (value) {
                        if (value != null) {
                          _viewmodel.courseList[index].courseName = value;
                          _state.rebuildState();
                        }
                      },
                    ),
                  ),
                  CustomCourseListTile(
                    label: 'Section',
                    details:
                        (_viewmodel.courseList[index].section > 9 ? '' : '0') +
                            _viewmodel.courseList[index].section.toString(),
                    onPressed: () async => await EditCourse.editSection(
                      context: context,
                      currentValue:
                          _viewmodel.courseList[index].section.toString(),
                    ).then(
                      (value) {
                        if (value != null) {
                          _viewmodel.courseList[index].section =
                              int.parse(value);
                          _state.rebuildState();
                        }
                      },
                    ),
                  ),
                  CustomCourseListTile(
                    label: 'Credit',
                    details: _viewmodel.courseList[index].credit.toString(),
                    onPressed: () async => await EditCourse.editCredit(
                      context: context,
                      currentValue:
                          _viewmodel.courseList[index].credit.toString(),
                    ).then(
                      (value) {
                        if (value != null) {
                          _viewmodel.courseList[index].credit =
                              int.parse(value);
                          _state.rebuildState();
                        }
                      },
                    ),
                  ),
                  CustomCourseListTile(
                    label: 'Targeted Grade',
                    details: _viewmodel.courseList[index].targetedGrade
                        .toUpperCase(),
                    onPressed: () async => await EditCourse.editTargetedGrade(
                      context: context,
                      currentValue: _viewmodel.courseList[index].targetedGrade,
                    ).then(
                      (value) {
                        if (value != null) {
                          _viewmodel.courseList[index].targetedGrade = value;
                          _state.rebuildState();
                        }
                      },
                    ),
                  ),
                  CustomCourseListTile(
                    label: 'Achieved Grade',
                    details:
                        _viewmodel.courseList[index].realGrade.toUpperCase(),
                    onPressed: () async => await EditCourse.editAchievedGrade(
                      context: context,
                      currentValue: _viewmodel.courseList[index].realGrade,
                    ).then(
                      (value) {
                        if (value != null) {
                          _viewmodel.courseList[index].realGrade = value;
                          _state.rebuildState();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Selected Course Information?'),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
            TextButton(
              child: Text("YES"),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("NO"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SemesterDetails(
            state: _state,
            viewmodel: _viewmodel,
          ),
          Text(
            'List of Courses',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ScrollSnapList(
              onItemFocus: (index) => {},
              itemSize: 10,
              itemBuilder: _buildListItem,
              itemCount: _viewmodel.courseList.length,
              reverse: true,
              focusOnItemTap: true,
            ),
          ),
        ],
      ),
    );
  }
}
