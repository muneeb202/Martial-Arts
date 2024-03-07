import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/register_page/models/register_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RegisterPage.
///
/// This class manages the state of the RegisterPage, including the
/// current registerModelObj
class RegisterController extends GetxController {
  RegisterController(this.registerModelObj);

  TextEditingController fullNameEditTextController = TextEditingController();

  TextEditingController userNameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  Rx<RegisterModel> registerModelObj;

  @override
  void onClose() {
    super.onClose();
    fullNameEditTextController.dispose();
    userNameEditTextController.dispose();
    emailEditTextController.dispose();
    passwordEditTextController.dispose();
  }
}
