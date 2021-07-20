import 'package:get_it/get_it.dart';
import 'package:managedo_mobile_app/screens/AddEducationScreen/AddEducation_viewmodel.dart';
import 'package:managedo_mobile_app/screens/AddSemesterScreen/AddSemester_viewmodel.dart';
import 'package:managedo_mobile_app/screens/AllEducationsPerformanceScreen/AllEducationsPerformance_viewmodel.dart';
import 'package:managedo_mobile_app/screens/EditEducationScreen/EditEducation_viewmodel.dart';
import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_viewmodel.dart';
import 'package:managedo_mobile_app/screens/ListStudentsScreen/ListStudents_viewmodel.dart';
import 'package:managedo_mobile_app/screens/ParentHomeScreen/ParentHome_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_viewmodel.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_viewmodel.dart';
import 'package:managedo_mobile_app/screens/StudentHomeScreen/StudentHome_viewmodel.dart';
import 'package:managedo_mobile_app/screens/StudentPerformanceScreen/StudentPerformanceGraph_viewmodel.dart';
import 'package:managedo_mobile_app/screens/LoginScreen/LoginScreen_viewmodel.dart';

import 'package:managedo_mobile_app/services/course/course_service.dart';
import 'package:managedo_mobile_app/services/course/course_service_rest.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';
import 'package:managedo_mobile_app/services/education/education_service_rest.dart';
import 'package:managedo_mobile_app/services/login/login_service.dart';
import 'package:managedo_mobile_app/services/login/login_service_rest.dart';
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
  dependency.registerLazySingleton<LoginService>(() => LoginServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => EducationInfoViewmodel());
  dependency.registerLazySingleton(() => StudentHomeViewmodel());
  dependency.registerLazySingleton(() => ParentHomeViewmodel());
  dependency.registerLazySingleton(() => ListStudentsViewmodel());
  dependency.registerLazySingleton(() => SemesterListViewmodel());
  dependency.registerLazySingleton(() => StudentPerformanceGraphViewmodel());
  dependency.registerLazySingleton(() => SemesterDetailsViewmodel());
  dependency.registerLazySingleton(() => AllEducationsPerformanceViewmodel());
  dependency.registerLazySingleton(() => LoginScreenViewmodel());
  dependency.registerLazySingleton(() => AddEducationViewmodel());
  dependency.registerLazySingleton(() => EditEducationViewmodel());
  dependency.registerLazySingleton(() => AddSemesterViewModel());
}
