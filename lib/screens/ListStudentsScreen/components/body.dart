import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/screens/ListStudentsScreen/ListStudents_viewmodel.dart';
import 'package:managedo_mobile_app/app/router.dart' as router;

class Body extends StatelessWidget {
  final ListStudentsViewmodel _viewmodel;
  Body({viewmodel}) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: _viewmodel.students == null || _viewmodel.students.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: Text('No Student\'s Information Available'),
            )
          : ListView(
              children: _viewmodel.students
                  .map(
                    (student) => Card(
                      color: Colors.green[200],
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      elevation: 10,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(3, 4))
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  student.profilePicURL,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            student.name,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            student.email,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          trailing: IconButton(
                            alignment: Alignment.centerRight,
                            icon: Icon(Icons.keyboard_arrow_right),
                            onPressed: () => Navigator.pushNamed(
                                context, router.allEducationPerformanceRoute,
                                arguments: student.id),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
