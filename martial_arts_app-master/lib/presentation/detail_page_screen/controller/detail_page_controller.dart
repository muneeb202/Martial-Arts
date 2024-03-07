import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/detail_page_screen/models/detail_page_model.dart';

/// A controller class for the DetailPageScreen.
///
/// This class manages the state of the DetailPageScreen, including the
/// current detailPageModelObj
class DetailPageController extends GetxController {
  Rx<DetailPageModel> detailPageModelObj = DetailPageModel().obs;
}
