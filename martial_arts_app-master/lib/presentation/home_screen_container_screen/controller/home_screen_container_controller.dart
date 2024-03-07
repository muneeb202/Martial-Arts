import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/home_screen_container_screen/models/home_screen_container_model.dart';

/// A controller class for the HomeScreenContainerScreen.
///
/// This class manages the state of the HomeScreenContainerScreen, including the
/// current homeScreenContainerModelObj
class HomeScreenContainerController extends GetxController {
  Rx<HomeScreenContainerModel> homeScreenContainerModelObj =
      HomeScreenContainerModel().obs;
}
