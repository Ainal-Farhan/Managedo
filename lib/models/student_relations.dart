//? This is the class to define the relationship
//? between parent and the student

class StudentRelations {
  int id;
  String relation;
  int studentId;
  int parentId;

  StudentRelations({
    this.id,
    this.relation,
    this.studentId,
    this.parentId,
  });
  StudentRelations.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          relation: json['relation'],
          studentId: json['studentId'],
          parentId: json['parentId'],
        );
  StudentRelations.copy(StudentRelations from)
      : this(
          id: from.id,
          relation: from.relation,
          studentId: from.studentId,
          parentId: from.parentId,
        );
}
