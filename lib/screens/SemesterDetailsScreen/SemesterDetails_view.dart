import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/models/course.dart';
import 'package:managedo_mobile_app/models/semester.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/float.dart';
import 'package:managedo_mobile_app/screens/view.dart';
import './components/body.dart';

class SemesterDetailsArguments {
  final int semesterId;
  final int studentId;
  final int educationId;

  SemesterDetailsArguments({
    @required this.semesterId,
    @required this.studentId,
    @required this.educationId,
  });
}

class SemesterDetailsView extends StatefulWidget {
  final int semesterId;
  final int studentId;
  final int educationId;

  SemesterDetailsView({
    @required this.semesterId,
    @required this.studentId,
    @required this.educationId,
  });

  static Route<dynamic> route({
    @required semesterId, 
    @required studentId, 
    @required educationId,
    }) =>
      MaterialPageRoute(
          builder: (_) => SemesterDetailsView(
                semesterId: semesterId,
                studentId: studentId,
                educationId: educationId,
              ));

  @override
  SemesterDetailsState createState() => SemesterDetailsState();
}

class SemesterDetailsState extends State<SemesterDetailsView> {
  final List<int> data = [1, 2, 3, 4, 5];
  int _focusedIndex = 0;

  // List of processes
  // 1. init
  // 2. delete-course
  // 3. delete-semester
  // 3. update-course
  // 4. update-semester
  String currentProcess = 'init';

  int selectedCourseId = -1;
  Course updatedCourse;
  Semester updatedSemester;

  int get focusedIndex => _focusedIndex;

  void onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  void rebuildState() {
    return setState(() {});
  }

  void updateSelectedCourse({@required Course course}) {
    setState(() {
      updatedCourse = course;
      currentProcess = 'update-course';
    });
  }

  void deletedSelectedCourse({@required int courseId}) {
    setState(() {
      selectedCourseId = courseId;
      currentProcess = 'delete-course';
    });
  }

  void updateSemester({@required Semester semester}) {
    setState(() {
      updatedSemester = Semester.copy(semester);
      currentProcess = 'update-course';
    });

    print('semester: ${semester.toJson().toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: View<SemesterDetailsViewmodel>(
            initViewmodel: (viewmodel) => currentProcess == 'init'
                ? viewmodel.init(
                    semesterId: widget.semesterId,
                  )
                : currentProcess == 'delete-course'
                    ? viewmodel.deleteSelectedCourse(
                        selectedCourseId: selectedCourseId,
                        semesterId: widget.semesterId)
                    : currentProcess == 'update-course'
                        ? viewmodel.updatedSelectedCourse(
                            updatedCourse: updatedCourse,
                            semesterId: widget.semesterId)
                        : currentProcess == 'update-semester'
                            ? viewmodel.updateSemester(
                                updatedSemester: updatedSemester,
                                semesterId: widget.semesterId)
                            : viewmodel,
            builder: (context, viewmodel, _) => Body(
              state: this,
              viewmodel: viewmodel,
            ),
          ),
          floatingActionButton: Float(),
        ),
      ),
    );
  }
}
