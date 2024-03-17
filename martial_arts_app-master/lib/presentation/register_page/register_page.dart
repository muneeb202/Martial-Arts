import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_art/presentation/login_page/login_page.dart';

import 'controller/register_controller.dart';
import 'models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/core/utils/validation_functions.dart';
import 'package:martial_art/widgets/custom_outlined_button.dart';
import 'package:martial_art/widgets/custom_text_form_field.dart';
import 'package:martial_art/services/ApiService.dart';
import 'package:martial_art/presentation/register_tab_container_screen/controller/register_tab_container_controller.dart';
import '../../routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key) {
    controller.userNameEditTextController.addListener(() {
      controller.passwordEditTextController.clear();
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterController controller =
      Get.put(RegisterController(RegisterModel().obs));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA700,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            width: SizeUtils.width,
            // height: Get.height / 1.5,
            child: Form(
              key: _formKey,
              child: Container(
                width: 390.h,
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  children: [
                    //SizedBox(height: 25.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.h,
                        right: 28.h,
                      ),
                      child: Column(
                        children: [
                          // SizedBox(height: 20,),
                          _buildFullNameEditText(),
                          SizedBox(height: 16.v),
                          _buildUserNameEditText(),
                          SizedBox(height: 16.v),
                          _buildEmailEditText(),
                          SizedBox(height: 16.v),
                          _buildPasswordEditText(),
                          SizedBox(height: 21.v),
                          // RichText(
                          //   text: TextSpan(
                          //     children: [
                          //       TextSpan(
                          //         text: "lbl_already_user".tr,
                          //         style: GoogleFonts.poppins(
                          //           color: Color(0XFF64748B),
                          //           fontWeight: FontWeight.w600,
                          //           fontSize: 11.fSize,
                          //         ),
                          //       ),
                          //       TextSpan(
                          //         text: "lbl_sign_in".tr,
                          //         style: GoogleFonts.montserrat(
                          //           color: Color(0XFFFF5B00),
                          //           fontWeight: FontWeight.w700,
                          //           fontSize: 11.fSize,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   textAlign: TextAlign.left,
                          // ),
                          SizedBox(height: 19.v),
                          _buildRegisterButton(),
                          SizedBox(height: 20.v),
                          _buildInputRow(),
                          SizedBox(height: 20.v),
                          _buildTextRow(),
                          SizedBox(height: 20.v),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullNameEditText() {
    return CustomTextFormField(
      controller: controller.fullNameEditTextController,
      hintText: "lbl_full_name".tr,
      autofocus: false,
      hintStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
      prefix: Container(
        margin: EdgeInsets.fromLTRB(24.h, 16.v, 12.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgFi1077063,
          height: 20.adaptSize,
          width: 20.adaptSize,
          color: appTheme.deepOrange50001,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 52.v,
      ),
      validator: (value) {
        if (value == "") {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildUserNameEditText() {
    return CustomTextFormField(
      controller: controller.userNameEditTextController,
      hintText: "lbl_user_name".tr,
      autofocus: false,
      hintStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
      prefix: Container(
        margin: EdgeInsets.fromLTRB(24.h, 16.v, 12.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgFi1077063,
          height: 20.adaptSize,
          width: 20.adaptSize,
          color: appTheme.deepOrange50001,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 52.v,
      ),
      validator: (value) {
        if (value == "") {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildEmailEditText() {
    return CustomTextFormField(
      controller: controller.emailEditTextController,
      hintText: "lbl_email_id".tr,
      autofocus: false,
      textInputType: TextInputType.emailAddress,
      hintStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
      prefix: Container(
        margin: EdgeInsets.fromLTRB(24.h, 16.v, 12.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgFi646094,
          height: 20.adaptSize,
          width: 20.adaptSize,
          color: appTheme.deepOrange50001,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 52.v,
      ),
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildPasswordEditText() {
    return CustomTextFormField(
      controller: controller.passwordEditTextController,
      hintText: "lbl_password".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      autofocus: false,
      hintStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
      prefix: Container(
        margin: EdgeInsets.fromLTRB(24.h, 16.v, 12.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgFi2889676,
          height: 20.adaptSize,
          width: 20.adaptSize,
          color: appTheme.deepOrange50001,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 52.v,
      ),
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "err_msg_please_enter_valid_password".tr;
        }
        return null;
      },
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildRegisterButton() {
    return CustomOutlinedButton(
      text: "lbl_register".tr,
      rightIcon: SvgPicture.asset(
        ImageConstant.imgSettings,
        height: 13.0,
        width: 13.0,
      ),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          int response = await ApiService.createUser(
              controller.fullNameEditTextController.text.trim(),
              controller.userNameEditTextController.text.trim(),
              controller.emailEditTextController.text.trim(),
              controller.passwordEditTextController.text);
          if (response == 201) {
            Get.snackbar(
                'Verification', 'Verify your email address through email sent',
                backgroundColor: Colors.white,
                colorText: Colors.blueGrey.withOpacity(.8),
                margin: EdgeInsets.only(top: 16.0));

            controller.fullNameEditTextController.clear();
            controller.userNameEditTextController.clear();
            controller.emailEditTextController.clear();
            controller.passwordEditTextController.clear();

            // Switch to the login tab after successful registration
            final RegisterTabContainerController tabController = Get.find();
            tabController.tabviewController.animateTo(0);
          } else if (response == 400) {
            Get.snackbar('Error', 'Username or email already exists',
                backgroundColor: Colors.white,
                colorText: Colors.blueGrey.withOpacity(.8),
                margin: EdgeInsets.only(top: 16.0));
          } else {
            Get.snackbar('Error', 'An error occurred, please try again',
                backgroundColor: Colors.white,
                colorText: Colors.blueGrey.withOpacity(.8),
                margin: EdgeInsets.only(top: 16.0));
          }
        }
      },
      buttonTextStyle: TextStyle(
        color: appTheme.whiteA70001,
        fontSize: 15.0,
        fontFamily: 'Montserrat',
      ),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL28,
    );
  }

  /// Section Widget
  Widget _buildInputRow() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 8.v,
              bottom: 7.v,
            ),
            child: SizedBox(
              width: 87.h,
              child: Divider(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              "lbl_or_sign_up_with".tr,
              style: TextStyle(
                color: appTheme.blueGray500,
                fontSize: 12.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.v,
              bottom: 7.v,
            ),
            child: SizedBox(
              width: 87.h,
              child: Divider(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGoogleButton() {
    return Expanded(
      child: CustomOutlinedButton(
        onPressed: controller.signIn,
        text: "lbl_google".tr,
        buttonTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: appTheme.gray50001,
            fontFamily: 'Montserrat',
            fontSize: 15.0),
        margin: EdgeInsets.only(right: 4.h),
        leftIcon: Container(
          //margin: EdgeInsets.only(right: 8.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIcon,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppleButton() {
    return Expanded(
      child: CustomOutlinedButton(
        text: "lbl_apple".tr,
        buttonTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: appTheme.gray50001,
            fontFamily: 'Montserrat',
            fontSize: 15.0),
        margin: EdgeInsets.only(left: 4.h),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 8.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIcon20x20,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGoogleButton(),
        // _buildAppleButton(),
      ],
    );
  }
}
