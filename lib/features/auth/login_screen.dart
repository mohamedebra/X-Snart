import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/LocalizationController.dart';
import '../../controller/auth_controller.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/images.dart';
import '../../core/constants/styles.dart';
import '../../core/helper/route_helper.dart';
import '../../core/widget/custom_button.dart';
import '../../core/widget/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController){
      return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        // appBar: (AppBar(
        //   leading: IconButton(
        //     onPressed: () => Get.back(),
        //     icon: Icon(Icons.arrow_back_ios_rounded,
        //         color: Theme.of(context).textTheme.bodyLarge!.color),
        //   ),
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // )),
        body: SafeArea(
            child: Scrollbar(
              child: Center(
                child: Container(
                  width: context.width > 700 ? 500 : context.width,
                  padding: context.width > 700
                      ? const EdgeInsets.all(50)
                      : const EdgeInsets.all(Dimensions.paddingSizeExtremeLarge),
                  margin: context.width > 700
                      ? EdgeInsets.all(Dimensions.paddingSizeDefault)
                      : EdgeInsets.zero,
                  decoration: context.width > 700
                      ? BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  )
                      : null,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.logo, width: 125),
                            // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            // Center(child: Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge))),
                            const SizedBox(
                                height: Dimensions.paddingSizeExtraLarge),

                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Sign In'.tr,
                                  style: robotoBold.copyWith(
                                      fontSize: Dimensions.fontSizeExtraLarge)),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),

                            CustomTextField(
                              hintText: 'Email',
                              controller: authController.phoneController,
                              inputType: TextInputType.emailAddress,

                            ),
                            const SizedBox(
                                height: Dimensions.paddingSizeExtraLarge),

                            CustomTextField(
                              hintText: 'Enter Your Password'.tr,
                              controller: authController.passwordController,
                              inputAction: TextInputAction.done,
                              inputType: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),

                            Row(children: [
                              Expanded(
                                child: ListTile(
                                  onTap: () => authController.toggleRememberMe(),
                                  leading: Checkbox(
                                    visualDensity: const VisualDensity(
                                        horizontal: -4, vertical: -4),
                                    activeColor: Theme.of(context).primaryColor,
                                    value: authController.isActiveRememberMe,
                                    onChanged: (bool? isChecked) =>
                                        authController.toggleRememberMe(),
                                  ),
                                  title: Text('Remember Me'.tr),
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  dense: true,
                                  horizontalTitleGap: 0,
                                ),
                              ),
                              // TextButton(
                              //   onPressed: () => Get.toNamed(RouteHelper.getForgotPassRoute(false, null)),
                              //   child: Text('${'forgot_password'.tr}', style: robotoMedium.copyWith(color: Theme.of(context).hintColor)),
                              // ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeLarge),

                            // ConditionCheckBox(authController: authController, fromSignUp: false),
                            const SizedBox(height: Dimensions.paddingSizeDefault),

                            CustomButton(
                              buttonText: 'Sign In'.tr,
                              onPressed: () => authController.login(),
                              isLoading: authController.isLoading,
                            ),
                            const SizedBox(
                                height: Dimensions.paddingSizeExtraLarge),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have account".tr,
                                      style: robotoRegular.copyWith(
                                          color: Theme.of(context).hintColor)),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.signUp);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          Dimensions.paddingSizeExtraSmall),
                                      child: Text('Sign Up'.tr,
                                          style: robotoMedium.copyWith(
                                              color:
                                              Theme.of(context).primaryColor)),
                                    ),
                                  ),
                                ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),

                            // const SocialLoginWidget(),

                            // const GuestButton(),
                          ]),
                    ),
                  ),
                ),
              ),
            )),
      );
    });
  }

  void _login(AuthController authController) {}
}
