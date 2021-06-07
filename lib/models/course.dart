class Course {
  int id;
  String courseCode;
  String courseName;
  int section;
  int credit;
  String targetedGrade;
  String realGrade;

  Course({
    this.id,
    this.courseCode,
    this.courseName,
    this.section,
    this.credit,
    this.targetedGrade,
    this.realGrade, // achievedGrade
  });

  Course.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          courseCode: json['courseCode'],
          courseName: json['courseName'],
          section: json['section'],
          credit: json['credit'],
          targetedGrade: json['targetedGrade'],
          realGrade: json['realGrade'],
        );

  Course.copy(Course from)
      : this(
          id: from.id,
          courseCode: from.courseCode,
          courseName: from.courseName,
          section: from.section,
          credit: from.credit,
          targetedGrade: from.targetedGrade,
          realGrade: from.realGrade,
        );
}
