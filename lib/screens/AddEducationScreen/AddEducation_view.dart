import 'package:flutter/material.dart';

import '../view.dart';
import './AddEducation_viewmodel.dart';
import '../../app/router.dart' as router;

class AddEducationScreen extends StatefulWidget {
  final int studentId;

  AddEducationScreen({this.studentId});

  static Route<dynamic> route({studentId}) => MaterialPageRoute(
      builder: (_) => AddEducationScreen(
            studentId: studentId,
          ));

  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducationScreen> {
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
          body: View<AddEducationViewmodel>(
            initViewmodel: (viewmodel) => viewmodel,
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
                            value: viewmodel.degree,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (value) => this.setState(() {
                              viewmodel.degree = value;
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
                              viewmodel.startDate = picked;

                              this.setState(() {});
                            },
                          ),
                          Text(
                              '${viewmodel.startDate.toString().substring(0, 11)}')
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
                        child: Text('ADD'),
                        onPressed: () async {
                          final isAdded = await viewmodel.addEducation(
                            studentId: widget.studentId,
                          );

                          if (isAdded) {
                            return showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Add New Education"),
                                  content:
                                      Text("Successfully add new education"),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () =>
                                          Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        router.educationRoute,
                                        (route) => false,
                                        arguments: widget.studentId,
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
                                  title: Text("Add New Education"),
                                  content: Text("Failed add new education"),
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
              arguments: widget.studentId,
            ),
          ),
        ),
      ),
    );
  }
}
