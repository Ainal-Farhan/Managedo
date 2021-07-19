import 'package:get_it/get_it.dart';
import 'package:managedo_mobile_app/screens/AllEducationsPerformanceScreen/AllEducationsPerformance_viewmodel.dart';
import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_viewmodel.dart';
import 'package:managedo_mobile_app/screens/ExampleScreen/Example_viewmodel.dart';
import 'package:managedo_mobile_app/screens/ListStudentsScreen/ListStudents_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_viewmodel.dart';
import 'package:managedo_mobile_app/screens/StudentPerformanceScreen/StudentPerformanceGraph_viewmodel.dart';
import 'package:managedo_mobile_app/screens/LoginScreen/LoginScreen_viewmodel.dart';

import 'package:managedo_mobile_app/services/course/course_service.dart';
import 'package:managedo_mobile_app/services/course/course_service_rest.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';
import 'package:managedo_mobile_app/services/education/education_service_rest.dart';
import 'package:managedo_mobile_app/services/semester/semester_service.dart';
import 'package:managedo_mobile_app/services/semester/semester_service_rest.dart';
import 'package:managedo_mobile_app/services/studentRelation/studentRelation_service.dart';
import 'package:managedo_mobile_app/services/studentRelation/studentRelation_service_rest.dart';
import 'package:managedo_mobile_app/services/user/user_service.dart';
import 'package:managedo_mobile_app/services/user/user_service_rest.dart';

import '../services/rest_service.dart';
import '../services/student/student_service.dart';
import '../services/student/student_service_rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton(() => RestService());
  dependency.registerLazySingleton<StudentService>(() => StudentServiceRest());
  dependency
      .registerLazySingleton<EducationService>(() => EducationServiceRest());
  dependency.registerLazySingleton<UserService>(() => UserServiceRest());
  dependency
      .registerLazySingleton<SemesterService>(() => SemesterServiceRest());
  dependency.registerLazySingleton<CourseService>(() => CourseServiceRest());
  dependency.registerLazySingleton<StudentRelationService>(
      () => StudentRelationServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => EducationInfoViewmodel());
  dependency.registerLazySingleton(() => ExampleViewmodel());
  dependency.registerLazySingleton(() => ListStudentsViewmodel());
  dependency.registerLazySingleton(() => SemesterListViewmodel());
  dependency.registerLazySingleton(() => StudentPerformanceGraphViewmodel());
  dependency.registerLazySingleton(() => SemesterDetailsViewmodel());
  dependency.registerLazySingleton(() => AllEducationsPerformanceViewmodel());
  dependency.registerLazySingleton(() => LoginScreenViewmodel());
}
