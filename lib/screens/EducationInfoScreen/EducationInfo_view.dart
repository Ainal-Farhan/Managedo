import 'package:flutter/material.dart';

import '../view.dart';
import 'EducationInfo_viewmodel.dart';

class EducationInfoView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => EducationInfoView());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Education Information'),
            centerTitle: true,
          ),
          body: View<EducationInfoViewmodel>(
            initViewmodel: (viewmodel) =>
                viewmodel.getEducationListBasedOnStudentId(1),
            builder: (context, viewmodel, _) {
              return Container(
                  color: Colors.white,
                  child: viewmodel.educations.length > 0
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            final education = viewmodel.educations[index];
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Card(
                                    color: Colors.black,
                                    borderOnForeground: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 10,
                                    child: Column(
                                      children: <Widget>[
                                        Card(
                                          color: Colors.white,
                                          borderOnForeground: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          elevation: 10,
                                          child: ListTile(
                                            subtitle: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'University'
                                                                .padRight(19) +
                                                            ':'.padRight(2) +
                                                            education
                                                                .universityName),
                                                    TextSpan(
                                                        text: '\nField'
                                                                .padRight(24) +
                                                            ':'.padRight(2) +
                                                            education.field),
                                                    TextSpan(
                                                        text: '\nDegree'
                                                                .padRight(21) +
                                                            ':'.padRight(2) +
                                                            education
                                                                .degreeLevel),
                                                    TextSpan(
                                                        text: '\nStart Date'
                                                                .padRight(20) +
                                                            ':'.padRight(2) +
                                                            '${education.startDate.day}-' +
                                                            '${education.startDate.month < 10 ? '0' : ''}${education.startDate.month}-' +
                                                            education
                                                                .startDate.year
                                                                .toString()),
                                                    TextSpan(
                                                        text: '\nTargeted CGPA'
                                                                .padRight(14) +
                                                            ':'.padRight(2) +
                                                            education
                                                                .targetedCGPA
                                                                .toStringAsFixed(
                                                                    2)),
                                                    TextSpan(
                                                        text: '\nTotal Semester'
                                                                .padRight(15) +
                                                            ':'.padRight(2) +
                                                            education
                                                                .semestersId
                                                                .length
                                                                .toString()),
                                                  ]),
                                            ),
                                            trailing: CircleAvatar(
                                              radius: 30.0,
                                              backgroundColor:
                                                  education.calculatedCGPA > 3.0
                                                      ? Colors.green[400]
                                                      : Colors.red[400],
                                              foregroundColor: Colors.black,
                                              child: Text(education
                                                  .calculatedCGPA
                                                  .toStringAsFixed(2)),
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
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 10,
                                              child: ElevatedButton(
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
                                                          showAlert(context),
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
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 10,
                                              child: ElevatedButton(
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
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 10,
                                              child: ElevatedButton(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      icon: Icon(
                                                        Icons.remove_red_eye,
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
                                          ],
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
                                                  MainAxisAlignment.center,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Semester Details',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                )),
                                                IconButton(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  icon: Icon(
                                                    Icons
                                                        .navigate_next_outlined,
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
                                      ],
                                    )),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                                color: Colors.blueGrey,
                              ),
                          itemCount: viewmodel.educations.length)
                      : Container(
                          alignment: Alignment.center,
                          child: Text('No Education Information Available'),
                        ));
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {},
          ),
        ),
      ),
    );
  }

  showAlert(BuildContext context) {
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
