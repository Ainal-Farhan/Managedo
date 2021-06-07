class Education {
  int id;
  String universityName;
  String field;
  String degreeLevel;
  DateTime startDate;
  double targetedCGPA;
  double achievedCGPA;
  int fkStudentId;

  Education({
    this.id,
    this.universityName,
    this.field,
    this.degreeLevel,
    this.startDate,
    this.targetedCGPA,
    this.achievedCGPA,
    this.fkStudentId,
  });

  Education.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          universityName: json['universityName'],
          field: json['field'],
          degreeLevel: json['degreeLevel'],
          startDate: DateTime.parse(json['startDate']),
          targetedCGPA: json['targetedCGPA'].toDouble(),
          achievedCGPA: json['achievedCGPA'].toDouble(),
          fkStudentId: json['fkStudentId'],
        );

  Education.copy(Education from)
      : this(
          id: from.id,
          universityName: from.universityName,
          field: from.field,
          degreeLevel: from.degreeLevel,
          startDate: from.startDate,
          targetedCGPA: from.targetedCGPA,
          achievedCGPA: from.achievedCGPA,
          fkStudentId: from.fkStudentId,
        );
}
