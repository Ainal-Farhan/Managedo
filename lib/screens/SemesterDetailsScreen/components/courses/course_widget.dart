import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_view.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/courses/custom_course_list_tile.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/courses/edit_course.dart';

class CourseWidget {
  static Widget buildListItem(
    BuildContext context, 
    int index, 
    SemesterDetailsViewmodel viewmodel, 
    SemesterDetailsState state) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
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
                              onPressed: () => _showAlert(
                                  context, 
                                  viewmodel.courses[index].id,
                                  state,
                                  ),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomCourseListTile(
                      label: 'Course Code',
                      details: viewmodel.courses[index].courseCode.toUpperCase(),
                      onPressed: () async => await EditCourse.editCourseCode(
                        context: context,
                        currentValue: viewmodel.courses[index].courseCode,
                      ).then(
                        (value) {
                          if (value != null) {
                            viewmodel.courses[index].courseCode = value;
                            state.updateSelectedCourse(
                                course: viewmodel.courses[index]);
                          }
                        },
                      ),
                    ),
                    CustomCourseListTile(
                      label: 'Course Name',
                      details: viewmodel.courses[index].courseName,
                      onPressed: () async => await EditCourse.editCourseName(
                        context: context,
                        currentValue: viewmodel.courses[index].courseName,
                      ).then(
                        (value) {
                          if (value != null) {
                            viewmodel.courses[index].courseName = value;
                            state.updateSelectedCourse(
                                course: viewmodel.courses[index]);
                          }
                        },
                      ),
                    ),
                    CustomCourseListTile(
                      label: 'Section',
                      details:
                          (viewmodel.courses[index].section > 9 ? '' : '0') +
                              viewmodel.courses[index].section.toString(),
                      onPressed: () async => await EditCourse.editSection(
                        context: context,
                        currentValue:
                            viewmodel.courses[index].section.toString(),
                      ).then(
                        (value) {
                          if (value != null) {
                            viewmodel.courses[index].section = int.parse(value);
                            state.updateSelectedCourse(
                                course: viewmodel.courses[index]);
                          }
                        },
                      ),
                    ),
                    CustomCourseListTile(
                      label: 'Credit',
                      details: viewmodel.courses[index].credit.toString(),
                      onPressed: () async => await EditCourse.editCredit(
                        context: context,
                        currentValue: viewmodel.courses[index].credit.toString(),
                      ).then(
                        (value) {
                          if (value != null) {
                            viewmodel.courses[index].credit = int.parse(value);
                            state.updateSelectedCourse(
                                course: viewmodel.courses[index]);
                          }
                        },
                      ),
                    ),
                    CustomCourseListTile(
                      label: 'Targeted Grade',
                      details:
                          viewmodel.courses[index].targetedGrade.toUpperCase(),
                      onPressed: () async => await EditCourse.editTargetedGrade(
                        context: context,
                        currentValue: viewmodel.courses[index].targetedGrade,
                      ).then(
                        (value) {
                          if (value != null) {
                            viewmodel.courses[index].targetedGrade = value;
                            state.updateSelectedCourse(
                                course: viewmodel.courses[index]);
                          }
                        },
                      ),
                    ),
                    CustomCourseListTile(
                      label: 'Achieved Grade',
                      details:
                          viewmodel.courses[index].achievedGrade.toUpperCase(),
                      onPressed: () async => await EditCourse.editAchievedGrade(
                        context: context,
                        currentValue: viewmodel.courses[index].achievedGrade,
                      ).then(
                        (value) {
                          if (value != null) {
                            viewmodel.courses[index].achievedGrade = value;
                            state.updateSelectedCourse(
                                course: viewmodel.courses[index]);
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

  static _showAlert(BuildContext context, int courseId, SemesterDetailsState state,) {
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
                Navigator.of(context).pop();
                state.deletedSelectedCourse(courseId: courseId);
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
}