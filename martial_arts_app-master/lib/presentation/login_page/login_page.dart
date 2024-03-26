import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'controller/login_controller.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/core/utils/validation_functions.dart';
import 'package:martial_art/widgets/custom_outlined_button.dart';
import 'package:martial_art/widgets/custom_text_form_field.dart';
import 'package:martial_art/services/ApiService.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key) {
    controller.userNameEditTextController.addListener(() {
      controller.passwordEditTextController.clear();
    });
  }

  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'login_form_key');

  LoginController controller = Get.put(LoginController(LoginModel().obs));
  //new line
  RxBool loading = false.obs;
  //end of new line

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: appTheme.whiteA700,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: 390.h,
                //decoration: AppDecoration.fillWhiteA700,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  children: [
                    //SizedBox(height: 26.v),
                    _buildUserInfo(),
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
  Widget _buildPasswordEditText() {
    return CustomTextFormField(
      controller: controller.passwordEditTextController,
      hintText: "lbl_password".tr,
      autofocus: false,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
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
  Widget _buildLoginButton() {
    return CustomOutlinedButton(
      text: "lbl_login".tr,
      rightIcon: SvgPicture.asset(
        ImageConstant.imgSettings,
        height: 13.0,
        width: 13.0,
      ),
      onPressed: () async {
        //new line
        loading.value = true;
        if (_formKey.currentState!.validate()) {
          int? response = await ApiService.loginUser(
              controller.userNameEditTextController.text.trim(),
              controller.passwordEditTextController.text);
          if (response == 200) {
            controller.userNameEditTextController.clear();
            controller.passwordEditTextController.clear();
            loading.value = false;

            Get.offAllNamed(AppRoutes.homeScreenContainerScreen);
          } else if (response == 401 || response == 403) {
            loading.value = false;
            Get.snackbar('Error', 'Invalid username or password',
                backgroundColor: Colors.white,
                colorText: Colors.blueGrey.withOpacity(.8),
                margin: EdgeInsets.only(top: 16.0));
          } else if (response == 402) {
            loading.value = false;
            Get.snackbar('Can\'t login', 'Email not verified',
                backgroundColor: Colors.white,
                colorText: Colors.blueGrey.withOpacity(.8),
                margin: EdgeInsets.only(top: 16.0));
          } else if (controller.userNameEditTextController.text.isEmpty &&
              controller.passwordEditTextController.text.isEmpty) {
            loading.value = false;
            Get.snackbar('Error', 'Invalid username or password',
                backgroundColor: Colors.white,
                colorText: Colors.blueGrey.withOpacity(.8),
                margin: EdgeInsets.only(top: 16.0));
          }
        } else {
          loading.value = false;
        }

        //end of new line
      },
      buttonTextStyle: TextStyle(
          fontSize: 15.0,
          color: appTheme.whiteA70001,
          fontFamily: 'Montserrat'),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL28,
    );
  }

  /// Section Widget
  Widget _buildGoogleButton() {
    return Expanded(
      child: CustomOutlinedButton(
        onPressed: controller.signIn,
        text: "lbl_google".tr,
        buttonTextStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: appTheme.gray50001,
          fontFamily: 'Montserrat',
        ),
        margin: EdgeInsets.only(right: 4.h),
        leftIcon: Container(
          // margin: EdgeInsets.only(right: 8.h),
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
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: appTheme.gray50001,
          fontFamily: 'Montserrat',
        ),
        margin: EdgeInsets.only(left: 4.h),
        leftIcon: Container(
          //margin: EdgeInsets.only(right: 8.h),
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
  Widget _buildUserInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          // SizedBox(height: 20,),
          _buildUserNameEditText(),
          SizedBox(height: 16.v),
          _buildPasswordEditText(),
          SizedBox(height: 16.v),
          // Container(
          //   decoration: AppDecoration.fillWhiteA700.copyWith(
          //     borderRadius: BorderRadiusStyle.circleBorder10,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Obx(
          //         () => CustomCheckboxButton(
          //           text: "lbl_remember_me".tr,
          //           textStyle: GoogleFonts.montserrat(
          //             fontWeight: FontWeight.w600,
          //           ),
          //           value: controller.rememberMe.value,
          //           padding: EdgeInsets.symmetric(vertical: 2.v),
          //           onChange: (value) {
          //             controller.rememberMe.value = value;
          //           },
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(top: 3.v),
          //         child: Text(
          //           "msg_forget_password".tr,
          //           style: TextStyle(
          //             color: theme.colorScheme.primary,
          //             fontSize: 12.fSize,
          //             fontFamily: 'Poppins',
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 25.v),
          // RichText(
          //   text: TextSpan(
          //     children: [
          //       TextSpan(
          //         text: "msg_are_you_a_new_user2".tr,
          //         style: GoogleFonts.poppins(
          //           color: Color(0XFF64748B),
          //           fontWeight: FontWeight.w600,
          //           fontSize: 11.fSize,
          //         ),
          //       ),
          //       TextSpan(
          //         text: "lbl_sign_up".tr,
          //         style: GoogleFonts.montserrat(
          //           color: Color(0XFFFF5B00),
          //           fontWeight: FontWeight.w600,
          //           fontSize: 11.fSize,
          //         ),
          //       ),
          //     ],
          //   ),
          //   textAlign: TextAlign.left,
          // ),
          SizedBox(height: 23.v),
          //new line
          Obx(() {
            return loading.value == true
                ? Lottie.asset('assets/lottie/loading.json',
                    width: 200, height: 80)
                : _buildLoginButton();
          }),
          //end of new line

          SizedBox(height: 24.v),
          Container(
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
                    width: 89.h,
                    child: Divider(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "lbl_or_sign_in_with".tr,
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
                    width: 89.h,
                    child: Divider(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGoogleButton(),
              // _buildAppleButton(),
            ],
          ),
        ],
      ),
    );
  }
}
