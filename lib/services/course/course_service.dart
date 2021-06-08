import 'package:managedo_mobile_app/models/course.dart';

abstract class CourseService {
  Future<List<Course>> getCourseListBasedOnSemesterId(int semesterId);
  Future<Course> updateCourse(Course updatedCourse);
  Future<bool> deleteCourse(int courseId);
}
