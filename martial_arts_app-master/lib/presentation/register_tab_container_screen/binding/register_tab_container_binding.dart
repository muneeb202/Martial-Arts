import '../controller/register_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RegisterTabContainerScreen.
///
/// This class ensures that the RegisterTabContainerController is created when the
/// RegisterTabContainerScreen is first loaded.
class RegisterTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterTabContainerController());
  }
}
