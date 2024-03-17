import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/register_page/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/services/ApiService.dart';
import 'package:martial_art/services/GoogleSignInAPI.dart';

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

  Future signIn() async {
    try {
      final user = await GoogleSignInAPI.login();
      if (user != null) {
        String name = user.displayName ?? user.email;
        String photo = user.photoUrl ?? "";
        GoogleSignInAPI.logout();
        bool success =
            await ApiService.GoogleSignIn(name, user.email, photo, user.id);
        if (success) {
          Get.toNamed(AppRoutes.homeScreenContainerScreen);
        } else {
          Get.snackbar('Error',
              'Email already exists! Try signing in with your username and password instead',
              backgroundColor: Colors.white,
              colorText: Colors.blueGrey.withOpacity(.8),
              margin: EdgeInsets.only(top: 16.0));
        }
      }
    } catch (e) {}
  }
}
