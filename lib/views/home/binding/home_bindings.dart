import 'package:get/get.dart';
import 'package:test_app/views/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeCtrl());
  }
}
