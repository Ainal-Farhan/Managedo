class Course {
  String courseCode;
  String courseName;
  int section;
  int credit;
  String targetedGrade;
  double totalAssessmentPercentage;
  String realGrade;

  Course(
      {this.courseCode,
      this.courseName,
      this.section,
      this.credit,
      this.targetedGrade,
      this.totalAssessmentPercentage,
      this.realGrade});

  Course.fromJson(Map<String, dynamic> json)
      : this(
            courseCode: json['courseCode'],
            courseName: json['courseName'],
            section: json['section'],
            credit: json['credit'],
            targetedGrade: json['targetedGrade'],
            totalAssessmentPercentage: json['totalAssessmentPercentage'],
            realGrade: json['realGrade']);

  Course.copy(Course from)
      : this(
            courseCode: from.courseCode,
            courseName: from.courseName,
            section: from.section,
            credit: from.credit,
            targetedGrade: from.targetedGrade,
            totalAssessmentPercentage: from.totalAssessmentPercentage,
            realGrade: from.realGrade);
}
