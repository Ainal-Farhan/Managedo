class Course {
  int id;
  String courseCode;
  String courseName;
  int section;
  int credit;
  String targetedGrade;
  String achievedGrade;
  int fkSemesterId;

  Course({
    this.id,
    this.courseCode,
    this.courseName,
    this.section,
    this.credit,
    this.targetedGrade,
    this.achievedGrade,
    this.fkSemesterId,
  });

  Course.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          courseCode: json['courseCode'],
          courseName: json['courseName'],
          section: json['section'],
          credit: json['credit'],
          targetedGrade: json['targetedGrade'],
          achievedGrade: json['achievedGrade'],
          fkSemesterId: json['fkSemesterId'],
        );

  Course.copy(Course from)
      : this(
          id: from.id,
          courseCode: from.courseCode,
          courseName: from.courseName,
          section: from.section,
          credit: from.credit,
          targetedGrade: from.targetedGrade,
          achievedGrade: from.achievedGrade,
          fkSemesterId: from.fkSemesterId,
        );

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'courseCode': this.courseCode,
    'courseName': this.courseName,
    'section': this.section,
    'credit': this.credit,
    'targetedGrade': this.targetedGrade,
    'achievedGrade': this.achievedGrade,
    'fkSemesterId': this.fkSemesterId,
  };
}
