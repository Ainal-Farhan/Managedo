import '../../app/dependencies.dart';

import '../../services/student/student_service.dart';
import '../viewmodel.dart';
import '../../models/student.dart';

class EducationInfoViewmodel extends Viewmodel {
  List<Student> students;
  int _selected;
  StudentService get dataService => dependency();

  void getStudentList() async {
    turnBusy();
    students = await dataService.getStudentList();
    _selected = null;
    turnIdle();
  }

  Student get student =>
      (students != null) && (_selected != null) ? students[_selected] : null;

  void selectStudent(int index) {
    _selected = index;
    turnIdle(); // Only to call to notifyListneres()
  }
}
