import 'package:e_store_app/utils/helpers/network_manage.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManage());
  }
}
