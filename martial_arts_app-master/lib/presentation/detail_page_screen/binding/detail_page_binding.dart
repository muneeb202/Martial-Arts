import '../controller/detail_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DetailPageScreen.
///
/// This class ensures that the DetailPageController is created when the
/// DetailPageScreen is first loaded.
class DetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPageController());
  }
}
