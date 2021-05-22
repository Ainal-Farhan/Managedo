import './course.dart';

class Semester {
  int semesterNo;
  int durationInWeek;
  double targetedGPA;
  double realGPA;
  int totalCredit;
  String semesterStatus;
  List<Course> courses;

  Semester(
      {this.semesterNo,
      this.durationInWeek,
      this.targetedGPA,
      this.realGPA,
      this.totalCredit,
      this.semesterStatus,
      this.courses});

  Semester.fromJson(Map<String, dynamic> json)
      : this(
          semesterNo: json['semesterNo'],
          durationInWeek: json['durationInWeek'],
          targetedGPA: json['targetedGPA'].toDouble(),
          realGPA: json['realGPA'].toDouble(),
          totalCredit: json['totalCredit'],
          semesterStatus: json['semesterStatus'],
          courses: json['courses'] != null
              ? (json['courses'] as List)
                  .map((course) => Course.fromJson(course))
                  .toList()
              : [],
        );

  Semester.copy(Semester from)
      : this(
          semesterNo: from.semesterNo,
          durationInWeek: from.durationInWeek,
          targetedGPA: from.targetedGPA,
          realGPA: from.realGPA,
          totalCredit: from.totalCredit,
          semesterStatus: from.semesterStatus,
          courses: from.courses.map((course) => Course.copy(course)).toList(),
        );
}
