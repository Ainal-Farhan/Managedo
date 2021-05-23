class Education {
  int id;
  String universityName;
  String field;
  String degreeLevel;
  DateTime startDate;
  double targetedCGPA;
  double calculatedCGPA;
  List<int> semestersId;

  Education({
    this.id,
    this.universityName,
    this.field,
    this.degreeLevel,
    this.startDate,
    this.targetedCGPA,
    this.calculatedCGPA,
    this.semestersId,
  });

  Education.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          universityName: json['universityName'],
          field: json['field'],
          degreeLevel: json['degreeLevel'],
          startDate: DateTime.parse(json['startDate']),
          targetedCGPA: json['targetedCGPA'].toDouble(),
          calculatedCGPA: json['calculatedCGPA'].toDouble(),
          semestersId: json['semestersId'] as List,
        );

  Education.copy(Education from)
      : this(
          id: from.id,
          universityName: from.universityName,
          field: from.field,
          degreeLevel: from.degreeLevel,
          startDate: from.startDate,
          targetedCGPA: from.targetedCGPA,
          calculatedCGPA: from.calculatedCGPA,
          semestersId: [...from.semestersId],
        );
}
