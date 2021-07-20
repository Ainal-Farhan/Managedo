import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/models/education.dart';

import '../view.dart';
import './EditEducation_viewmodel.dart';
import '../../app/router.dart' as router;

class EditEducationScreen extends StatefulWidget {
  final Education education;

  EditEducationScreen({this.education});

  static Route<dynamic> route({education}) => MaterialPageRoute(
      builder: (_) => EditEducationScreen(
            education: education,
          ));

  @override
  _EditEducationState createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Add New Education'),
            centerTitle: true,
          ),
          body: View<EditEducationViewmodel>(
            initViewmodel: (viewmodel) =>
                viewmodel.init(education: widget.education),
            builder: (context, viewmodel, _) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: viewmodel.universityNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'University Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: viewmodel.fieldController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Field',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Degree Level:'),
                          DropdownButton<String>(
                            value: viewmodel.education.degreeLevel,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (value) => this.setState(() {
                              viewmodel.education.degreeLevel = value;
                            }),
                            items: <String>[
                              'Diploma',
                              'Degree',
                              'Master',
                              'PhD'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text('Start Date: '),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () async {
                              final DateTime picked = await showDatePicker(
                                context: context,
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1970, 1, 1),
                                lastDate: DateTime(2029, 1, 1),
                              );
                              viewmodel.education.startDate = picked;

                              this.setState(() {});
                            },
                          ),
                          Text(
                              '${viewmodel.education.startDate.toString().substring(0, 11)}')
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: viewmodel.targetedCGPAController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Targeted CGPA',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: viewmodel.achievedCGPAController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Achieved CGPA',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: Text('UPDATE'),
                        onPressed: () async {
                          final isAdded = await viewmodel.updateEducation();

                          if (isAdded) {
                            return showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Update Education"),
                                  content:
                                      Text("Successfully update education"),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () =>
                                          Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        router.educationRoute,
                                        (route) => false,
                                        arguments: widget.education.fkStudentId,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Update Education"),
                                  content: Text("Failed update education"),
                                  actions: [
                                    TextButton(
                                        child: Text("OK"),
                                        onPressed: () =>
                                            Navigator.pop(context)),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              router.educationRoute,
              arguments: widget.education.fkStudentId,
            ),
            heroTag: null,
          ),
        ),
      ),
    );
  }
}
