import 'package:flutter/material.dart';

import '../view.dart';
import './EducationInfo_viewmodel.dart';
import '../../app/router.dart' as router;

class EducationInfoScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => EducationInfoScreen());

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
            initViewmodel: (viewmodel) => viewmodel.getStudentList(),
            builder: (context, viewmodel, _) {
              final students = viewmodel.students;

              return ListView.separated(
                itemCount: students.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.blueGrey,
                ),
                itemBuilder: (context, index) {
                  final student = students[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(student.profilePicURL),
                    ),
                    title: Text(student.name),
                    subtitle: Text(
                        'semester length:  ${student.educations[0].semesters.length}'),
                    onTap: () {
                      viewmodel.selectStudent(index);
                      Navigator.pushReplacementNamed(
                          context, router.educationRoute);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
