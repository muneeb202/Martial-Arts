import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/login_page/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/services/ApiService.dart';
import 'package:martial_art/services/GoogleSignInAPI.dart';
import 'dart:developer';

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
        }
      }
    } catch (e) {}
  }
}
