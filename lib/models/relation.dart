//? This is the class to define the relationship
//? between parent and the student

class StudentRelations {
  int id;
  String relation;
  int fkStudentId;
  int fkParentId;

  StudentRelations({
    this.id,
    this.relation,
    this.fkStudentId,
    this.fkParentId,
  });
  StudentRelations.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          relation: json['relation'],
          fkStudentId: json['fkStudentId'],
          fkParentId: json['fkParentId'],
        );
  StudentRelations.copy(StudentRelations from)
      : this(
          id: from.id,
          relation: from.relation,
          fkStudentId: from.fkStudentId,
          fkParentId: from.fkParentId,
        );
}
