import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/course.dart';
import 'package:managedo_mobile_app/models/semester.dart';
import 'package:managedo_mobile_app/services/course/course_service.dart';
import 'package:managedo_mobile_app/services/semester/semester_service.dart';

import '../viewmodel.dart';

class SemesterDetailsViewmodel extends Viewmodel {
  Semester sem;
  List<Course> courses;

  CourseService get _courseService => dependency();
  SemesterService get _semesterService => dependency();

  List<String> semesterLabels = [
    'Semester',
    'Duration',
    'Targeted GPA',
    'Achieved GPA',
    'Total Credit',
    'Semester Status',
  ];

  List<String> semesterDetails = [
    '1',
    '15 weeks',
    '4.00',
    '3.56',
    '15',
    'Complete',
  ];

  Future<void> init({@required semesterId}) async {
    turnBusy();

    sem = await _semesterService.getSemesterBasedOnId(semesterId);

    courses = await _courseService
        .getCourseListBasedOnSemesterId(semesterId)
        .catchError((err) => null);

    turnIdle();
  }

  Future<int> deleteSemester() async {
    final isDeleted = await _semesterService.deleteSemester(sem.id);
    return isDeleted ? sem.fkEducationId : -1;
  }

  Future<void> deleteSelectedCourse({
    @required selectedCourseId,
    @required semesterId,
  }) async {
    turnBusy();

    await _courseService.deleteCourse(selectedCourseId);
    courses = await _courseService.getCourseListBasedOnSemesterId(semesterId);
    sem = await _semesterService.getSemesterBasedOnId(semesterId);

    turnIdle();
  }

  Future<void> updatedSelectedCourse({
    @required updatedCourse,
    @required semesterId,
  }) async {
    turnBusy();

    await _courseService.updateCourse(updatedCourse);
    courses = await _courseService.getCourseListBasedOnSemesterId(semesterId);
    sem = await _semesterService.getSemesterBasedOnId(semesterId);

    turnIdle();
  }

  Future<void> updateSemester({
    @required updatedSemester,
    @required semesterId,
  }) async {
    turnBusy();

    await _semesterService.updateSemester(updatedSemester);
    courses = await _courseService.getCourseListBasedOnSemesterId(semesterId);
    sem = await _semesterService.getSemesterBasedOnId(semesterId);

    turnIdle();
  }
}
