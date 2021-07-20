import 'package:flutter/material.dart';

import 'package:managedo_mobile_app/app/router.dart' as router;
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_view.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_view.dart';

class Body extends StatelessWidget {
  const Body({state, viewmodel})
      : _state = state,
        _viewmodel = viewmodel;

  final EducationInfoState _state;
  final _viewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: _viewmodel.educations.length > 0
            ? ListView.separated(
                itemBuilder: (context, index) {
                  final education = _viewmodel.educations[index];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                          color: Colors.green[200],
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Card(
                                color: Colors.white54,
                                borderOnForeground: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 10,
                                child: ExpansionTile(
                                  initiallyExpanded: false,
                                  title: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        children: <TextSpan>[
                                          TextSpan(
                                              style: TextStyle(
                                                fontSize: 20,
                                                foreground: Paint()
                                                  ..shader = LinearGradient(
                                                    colors: <Color>[
                                                      Colors.black,
                                                      Colors.green
                                                    ],
                                                  ).createShader(Rect.fromLTWH(
                                                      0.0, 0.0, 200.0, 70.0)),
                                              ),
                                              text: 'Education #${index + 1}'),
                                          TextSpan(
                                              text:
                                                  '\n${education.universityName}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  foreground: Paint()
                                                    ..shader = LinearGradient(
                                                      colors: <Color>[
                                                        Colors.black,
                                                        Colors.green
                                                      ],
                                                    ).createShader(
                                                        Rect.fromLTWH(0.0, 0.0,
                                                            200.0, 70.0)))),
                                        ]),
                                  ),
                                  backgroundColor: null,
                                  children: <Widget>[
                                    ListTile(
                                      subtitle: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                foreground: Paint()
                                                  ..shader = LinearGradient(
                                                    colors: <Color>[
                                                      Colors.green,
                                                      Colors.black
                                                    ],
                                                  ).createShader(Rect.fromLTWH(
                                                      0.0, 0.0, 200.0, 70.0)),
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      '\n${education.degreeLevel} in ${education.field}'),
                                              TextSpan(
                                                  text: '\nStart study on ${education.startDate.day}-' +
                                                      '${education.startDate.month < 10 ? '0' : ''}${education.startDate.month}-' +
                                                      education.startDate.year
                                                          .toString()),
                                              TextSpan(
                                                  text: '\nTargeted CGPA, ' +
                                                      education.targetedCGPA
                                                          .toStringAsFixed(2)),
                                            ]),
                                      ),
                                      trailing: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor:
                                            education.achievedCGPA > 3.0
                                                ? Colors.green[400]
                                                : Colors.red[400],
                                        foregroundColor: Colors.black,
                                        child: Text(
                                          education.achievedCGPA
                                              .toStringAsFixed(2),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Card(
                                            color: Colors.redAccent,
                                            borderOnForeground: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 10,
                                            child: IconButton(
                                              alignment: Alignment.center,
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () => _showAlert(
                                                  context,
                                                  _viewmodel
                                                      .educations[index].id),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Card(
                                            color: Colors.lightGreen,
                                            borderOnForeground: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 10,
                                            child: IconButton(
                                              alignment: Alignment.center,
                                              icon: Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              onPressed: () =>
                                                  Navigator.pushNamed(
                                                context,
                                                router.editEducationScreenRoute,
                                                arguments: Education.copy(
                                                  _viewmodel.educations[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Card(
                                            color: Colors.blueAccent,
                                            borderOnForeground: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 10,
                                            child: IconButton(
                                              alignment: Alignment.center,
                                              icon: Icon(
                                                Icons.auto_graph_rounded,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              onPressed: () =>
                                                  Navigator.pushNamed(
                                                      context,
                                                      router
                                                          .performanceGraphRoute,
                                                      arguments: education.id),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Card(
                                            color: Colors.blueGrey,
                                            borderOnForeground: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 10,
                                            child: IconButton(
                                              alignment: Alignment.center,
                                              icon: Icon(
                                                Icons.navigate_next_outlined,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              onPressed: () =>
                                                  Navigator.pushNamed(
                                                context,
                                                router.listSemestersRoute,
                                                arguments:
                                                    SemesterListViewArguments(
                                                  educationId: education.id,
                                                  studentId:
                                                      education.fkStudentId,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      color: null,
                      thickness: 0,
                      endIndent: 0,
                      height: 0,
                      indent: 0,
                    ),
                itemCount: _viewmodel.educations.length)
            : Container(
                alignment: Alignment.center,
                child: Text('No Education Information Available'),
              ));
  }

  _showAlert(BuildContext context, int educationId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Selected Education Information?'),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
            TextButton(
              child: Text("YES"),
              onPressed: () =>
                  _state.deleteSelectedEducation(educationId: educationId),
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
