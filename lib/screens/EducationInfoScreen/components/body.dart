import 'package:flutter/material.dart';

import 'package:managedo_mobile_app/app/router.dart' as router;

class Body extends StatelessWidget {
  // const Body({state, viewmodel})
  //     : _state = state,
  //       _viewmodel = viewmodel;
  const Body({state, viewmodel}) : _viewmodel = viewmodel;

  // final EducationInfoView _state;
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
                                              TextSpan(
                                                  text: '\nTotal Semester, ' +
                                                      education
                                                          .semestersId.length
                                                          .toString()),
                                            ]),
                                      ),
                                      trailing: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor:
                                            education.calculatedCGPA > 3.0
                                                ? Colors.green[400]
                                                : Colors.red[400],
                                        foregroundColor: Colors.black,
                                        child: Text(
                                          education.calculatedCGPA
                                              .toStringAsFixed(2),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Card(
                                          color: Colors.white,
                                          borderOnForeground: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          elevation: 10,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.redAccent,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  onPressed: () =>
                                                      _showAlert(context),
                                                )
                                              ],
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Card(
                                          color: Colors.white,
                                          borderOnForeground: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          elevation: 10,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blueAccent),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  onPressed: () => {},
                                                )
                                              ],
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Card(
                                          color: Colors.white,
                                          borderOnForeground: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          elevation: 10,
                                          child: ElevatedButton(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  alignment: Alignment.center,
                                                  icon: Icon(
                                                    Icons
                                                        .navigate_next_outlined,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          router
                                                              .listSemestersRoute),
                                                )
                                              ],
                                            ),
                                            onPressed: () {},
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

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Selected Education Information?'),
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
            TextButton(
              child: Text("CANCEL"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
