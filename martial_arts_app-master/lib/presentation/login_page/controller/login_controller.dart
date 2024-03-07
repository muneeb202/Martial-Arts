import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/login_page/models/login_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginPage.
///
/// This class manages the state of the LoginPage, including the
/// current loginModelObj
class LoginController extends GetxController {
  LoginController(this.loginModelObj);

  TextEditingController userNameEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  Rx<LoginModel> loginModelObj;

  Rx<bool> rememberMe = false.obs;

  @override
  void onClose() {
    super.onClose();
    userNameEditTextController.dispose();
    passwordEditTextController.dispose();
  }
}
