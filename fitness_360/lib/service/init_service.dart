import 'package:get/get.dart';
import 'package:fitness_360/interface/assessments/controller/controller_physical_evolution.dart';
import 'package:fitness_360/interface/home/controller/home_page_view_controller.dart';
import 'package:fitness_360/interface/home/service/home_service.dart';
import 'package:fitness_360/interface/training/workouts/controller/controller_workout.dart';
import 'package:fitness_360/models/config_database.dart';
import 'package:fitness_360/service/dio_provider.dart';

Future<void> initServices() async {
  Get.put(ConfigDatabase());
  await Get.find<ConfigDatabase>().initDatabase();
  Get.put(ServiceDioProvider());
  var dioConn = Get.find<ServiceDioProvider>().getDio();
  Get.put(HomeService(dioConn));

  Get.put(HomePageViewController());
  Get.put(WorkoutController());
  Get.put(PhysicalController());
}
