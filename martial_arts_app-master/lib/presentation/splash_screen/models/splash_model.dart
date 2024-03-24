import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'rremovebgprev_item_model.dart';

/// This class defines the variables used in the [splash_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SplashModel {
  Rx<List<RremovebgprevItemModel>> rremovebgprevItemList =
      Rx(List.generate(1, (index) => RremovebgprevItemModel()));
}
