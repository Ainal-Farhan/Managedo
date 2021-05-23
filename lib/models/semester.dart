class Semester {
  int id;
  int semesterNo;
  int durationInWeek;
  double targetedGPA;
  double realGPA;
  int totalCredit;
  String semesterStatus;
  List<int> coursesId;

  Semester({
    this.id,
    this.semesterNo,
    this.durationInWeek,
    this.targetedGPA,
    this.realGPA,
    this.totalCredit,
    this.semesterStatus,
    this.coursesId,
  });

  Semester.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          semesterNo: json['semesterNo'],
          durationInWeek: json['durationInWeek'],
          targetedGPA: json['targetedGPA'].toDouble(),
          realGPA: json['realGPA'].toDouble(),
          totalCredit: json['totalCredit'],
          semesterStatus: json['semesterStatus'],
          coursesId: json['coursesId'] as List,
        );

  Semester.copy(Semester from)
      : this(
          semesterNo: from.semesterNo,
          durationInWeek: from.durationInWeek,
          targetedGPA: from.targetedGPA,
          realGPA: from.realGPA,
          totalCredit: from.totalCredit,
          semesterStatus: from.semesterStatus,
          coursesId: [...from.coursesId],
        );
}
