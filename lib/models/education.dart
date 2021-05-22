import './semester.dart';

class Education {
  List<Semester> semesters;
  String universityName;
  String field;
  String degreeLevel;
  DateTime startDate;
  double targetedCGPA;
  double calculatedCGPA;

  Education(
      {this.semesters,
      this.universityName,
      this.field,
      this.degreeLevel,
      this.startDate,
      this.targetedCGPA,
      this.calculatedCGPA});

  Education.fromJson(Map<String, dynamic> json)
      : this(
            semesters: json['semesters'] != null
                ? (json['semesters'] as List)
                    .map((semester) => Semester.fromJson(semester))
                    .toList()
                : [],
            universityName: json['universityName'],
            field: json['field'],
            degreeLevel: json['degreeLevel'],
            startDate: DateTime.parse(json['startDate']),
            targetedCGPA: json['targetedCGPA'].toDouble(),
            calculatedCGPA: json['calculatedCGPA'].toDouble());

  Education.copy(Education from)
      : this(
            semesters: from.semesters
                .map((semester) => Semester.copy(semester))
                .toList(),
            universityName: from.universityName,
            field: from.field,
            degreeLevel: from.degreeLevel,
            startDate: from.startDate,
            targetedCGPA: from.targetedCGPA,
            calculatedCGPA: from.calculatedCGPA);
}
