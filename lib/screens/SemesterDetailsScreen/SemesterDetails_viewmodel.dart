import 'package:managedo_mobile_app/models/course.dart';
import 'package:managedo_mobile_app/models/semester.dart';

import '../viewmodel.dart';

class SemesterDetailsViewmodel extends Viewmodel {
  List<String> semesterLabels = [
    'Semester',
    'Duration',
    'Targeted GPA',
    'Achieved GPA',
    'Total Credit',
    'Semester Status',
  ];

  List<Semester> semesters = [
    Semester(
      id: 1,
      semesterNo: 1,
      durationInWeek: 15,
      targetedGPA: 4.00,
      realGPA: 3.78,
      totalCredit: 15,
      semesterStatus: 'incomplete',
      coursesId: [1, 2],
    ),
  ];
  List<String> semesterDetails = [
    '1',
    '15 weeks',
    '4.00',
    '3.56',
    '15',
    'Complete',
  ];

  List<Course> courseList = [
    Course(
      courseCode: 'SCSJ2013',
      courseName: 'Object Oriented Programming',
      credit: 4,
      id: 1,
      realGrade: 'A+',
      section: 2,
      targetedGrade: 'A+',
    ),
    Course(
      courseCode: 'SCSJ3012',
      courseName: 'Software Engineering',
      credit: 3,
      id: 2,
      realGrade: 'B+',
      section: 4,
      targetedGrade: 'A+',
    ),
  ];

  init() async {
    turnBusy();
    turnIdle();
  }
}
