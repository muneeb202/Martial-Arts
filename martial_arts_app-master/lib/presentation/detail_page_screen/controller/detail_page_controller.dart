import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:martial_art/presentation/detail_page_screen/models/detail_page_model.dart';

/// A controller class for the DetailPageScreen.
///
/// This class manages the state of the DetailPageScreen, including the
/// current detailPageModelObj
class DetailPageController extends GetxController {
  Rx<DetailPageModel> detailPageModelObj = DetailPageModel().obs;
}
