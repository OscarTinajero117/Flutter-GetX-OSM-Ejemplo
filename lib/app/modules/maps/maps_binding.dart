import 'package:get/get.dart';
import 'package:open_street_map/app/modules/maps/maps_controller.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsController>(() => MapsController());
  }
}
