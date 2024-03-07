import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/data/apiClient/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
