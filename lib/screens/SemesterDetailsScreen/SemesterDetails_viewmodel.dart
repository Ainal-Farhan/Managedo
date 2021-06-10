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

  static CourseService get _courseService => dependency();
  static SemesterService get _semesterService => dependency();

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

  static Future<bool> deleteSemester({int semesterId}) async {
    return await _semesterService.deleteSemester(semesterId);
  }

  static Future<bool> deleteSelectedCourse({
    @required selectedCourseId,
    @required semesterId,
  }) async {
    return await _courseService.deleteCourse(selectedCourseId);
  }

  static Future<bool> updatedSelectedCourse({
    @required updatedCourse,
    @required semesterId,
  }) async {
    final result = await _courseService.updateCourse(updatedCourse);

    return result != null;
  }

  static Future<bool> updateSemester({
    @required updatedSemester,
    @required semesterId,
  }) async {
    final updated = await _semesterService.updateSemester(updatedSemester);

    return updated != null;
  }
}
