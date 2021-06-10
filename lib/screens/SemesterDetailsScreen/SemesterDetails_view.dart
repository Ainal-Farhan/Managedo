import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/LoadingScreen/LoadingScreen.dart';
import 'package:managedo_mobile_app/models/course.dart';
import 'package:managedo_mobile_app/models/semester.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/components/float.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_view.dart';
import 'package:managedo_mobile_app/screens/view.dart';
import 'package:managedo_mobile_app/app/router.dart' as router;
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

  int get focusedIndex => _focusedIndex;

  void onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  void rebuildState() {
    return setState(() {});
  }

  Future<dynamic> updateSelectedCourse({@required Course course}) {
    final load = LoadingScreen(
      processes: [
        (LoadingScreenState loadState) async {
          final isUpdated =
              await SemesterDetailsViewmodel.updatedSelectedCourse(
                  updatedCourse: course, semesterId: widget.semesterId);

          loadState.message = 'Update ' + (isUpdated ? 'Success' : 'Failed');
          loadState.rebuildScreen();

          await Future.delayed(Duration(milliseconds: 500));
        },
        (LoadingScreenState loadState) async {
          loadState.message = 'Navigating to Semester Details Screen';
          loadState.rebuildScreen();
          await Future.delayed(Duration(milliseconds: 500));
        }
      ],
      nextScreenArguments: SemesterDetailsArguments(
        educationId: widget.educationId,
        semesterId: widget.semesterId,
        studentId: widget.studentId,
      ),
      nextScreenRoute: router.semesterDetailsRoute,
      title: 'Update Course Information',
      initialMessage: 'Updating ...',
    );

    return Navigator.pushNamed(
      context,
      router.loadingScreenRoute,
      arguments: load,
    );
  }

  Future<void> deletedSelectedCourse({@required int courseId}) {
    final load = LoadingScreen(
      processes: [
        (LoadingScreenState loadState) async {
          final isDeleted = await SemesterDetailsViewmodel.deleteSelectedCourse(
              selectedCourseId: courseId, semesterId: widget.semesterId);

          loadState.message = 'Delete ' + (isDeleted ? 'Success' : 'Failed');
          loadState.rebuildScreen();

          await Future.delayed(Duration(milliseconds: 500));
        },
        (LoadingScreenState loadState) async {
          loadState.message = 'Navigating to Semester Details Screen';
          loadState.rebuildScreen();
          await Future.delayed(Duration(milliseconds: 500));
        }
      ],
      nextScreenArguments: SemesterDetailsArguments(
        educationId: widget.educationId,
        semesterId: widget.semesterId,
        studentId: widget.studentId,
      ),
      nextScreenRoute: router.semesterDetailsRoute,
      title: 'Delete Course Information',
      initialMessage: 'Deleting ...',
    );

    return Navigator.pushNamed(
      context,
      router.loadingScreenRoute,
      arguments: load,
    );
  }

  Future<void> updateSemester({@required Semester semester}) {
    final load = LoadingScreen(
      processes: [
        (LoadingScreenState loadState) async {
          final isUpdated = await SemesterDetailsViewmodel.updateSemester(
              updatedSemester: semester, semesterId: widget.semesterId);

          loadState.message = 'Update ' + (isUpdated ? 'Success' : 'Failed');
          loadState.rebuildScreen();

          await Future.delayed(Duration(milliseconds: 500));
        },
        (LoadingScreenState loadState) async {
          loadState.message = 'Navigating to Semester Details Screen';
          loadState.rebuildScreen();
          await Future.delayed(Duration(milliseconds: 500));
        }
      ],
      nextScreenArguments: SemesterDetailsArguments(
        educationId: widget.educationId,
        semesterId: widget.semesterId,
        studentId: widget.studentId,
      ),
      nextScreenRoute: router.semesterDetailsRoute,
      title: 'Update Semester Information',
      initialMessage: 'Updating ...',
    );

    return Navigator.pushNamed(
      context,
      router.loadingScreenRoute,
      arguments: load,
    );
  }

  Future<void> deleteSemester() {
    final load = LoadingScreen(
      processes: [
        (LoadingScreenState loadState) async {
          final isDeleted = await SemesterDetailsViewmodel.deleteSemester(
              semesterId: widget.semesterId);

          loadState.message = 'Delete ' + (isDeleted ? 'Success' : 'Failed');
          loadState.rebuildScreen();

          await Future.delayed(Duration(milliseconds: 500));
        },
        (LoadingScreenState loadState) async {
          loadState.message = 'Navigating to Semester List Screen';
          loadState.rebuildScreen();
          await Future.delayed(Duration(milliseconds: 500));
        }
      ],
      nextScreenArguments: SemesterListViewArguments(
        educationId: widget.educationId,
        studentId: widget.studentId,
      ),
      nextScreenRoute: router.listSemestersRoute,
      title: 'Delete Semester Information',
      initialMessage: 'Deleting ...',
    );

    return Navigator.pushNamed(
      context,
      router.loadingScreenRoute,
      arguments: load,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: View<SemesterDetailsViewmodel>(
            initViewmodel: (viewmodel) => viewmodel.init(
                    semesterId: widget.semesterId,
                  ),
            builder: (context, viewmodel, _) => Body(
              state: this,
              viewmodel: viewmodel,
            ),
          ),
          floatingActionButton: Float(
            state: this,
          ),
        ),
      ),
    );
  }
}
