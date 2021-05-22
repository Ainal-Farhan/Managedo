import 'package:get_it/get_it.dart';
import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_viewmodel.dart';

import '../services/rest_service.dart';
import '../services/student/student_service.dart';
import '../services/student/student_service_rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton(() => RestService());
  dependency.registerLazySingleton<StudentService>(() => StudentServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => EducationInfoViewmodel());
}
