import './student.dart';

//? This is the class to define the relationship
//? between parent and the student

class StudentRelationship {
  Student student;
  String relation;

  StudentRelationship({this.student, this.relation});
  StudentRelationship.fromJson(Map<String, dynamic> json)
      : this(
            student: json['student'] != null
                ? Student.fromJson(json['student'])
                : null,
            relation: json['relation']);
  StudentRelationship.copy(StudentRelationship from)
      : this(student: Student.copy(from.student), relation: from.relation);
}
