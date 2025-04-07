import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/LocalizationController.dart';
import '../../controller/auth_controller.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/images.dart';
import '../../core/constants/styles.dart';
import '../../core/helper/route_helper.dart';
import '../../core/widget/custom_button.dart';
import '../../core/widget/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).cardColor,
      body: SafeArea(child: Scrollbar(
        child: Center(
          child: Container(
            width: context.width > 700 ? 700 : context.width,
            padding: context.width > 700 ? const EdgeInsets.all(40) : EdgeInsets.all(Dimensions.paddingSizeLarge),
            margin: context.width > 700 ? const EdgeInsets.all(Dimensions.paddingSizeDefault) : null,
            decoration: context.width > 700 ? BoxDecoration(
              color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              // boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300]!, blurRadius: 5, spreadRadius: 1)],
            ) : null,
            child: GetBuilder<AuthController>(builder: (authController) {

              return SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [


                  Image.asset(Images.logo, width: 125),
                  // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  // Center(child: Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge))),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Sign Up'.tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  Row(children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: 'First name'.tr,
                        controller: authController.firstNameController,
                        inputType: TextInputType.name,
                        capitalization: TextCapitalization.words,
                        prefixIcon: Icons.person,
                      ),
                    ),
                    const SizedBox(width: Dimensions.paddingSizeSmall),

                    Expanded(
                      child: CustomTextField(
                        hintText: 'Last name'.tr,
                        controller: authController.lastNameController,

                        inputType: TextInputType.name,
                        capitalization: TextCapitalization.words,
                        prefixIcon: Icons.person,
                      ),
                    )
                  ]),
                  const SizedBox(height: Dimensions.paddingSizeLarge),

                  Row(children: [

                    Expanded(
                      child: CustomTextField(
                        controller: authController.phoneSignUpController,

                        inputType: TextInputType.emailAddress,

                        hintText: 'Email',
                      ),
                    ),

                  ]),
                  const SizedBox(height: Dimensions.paddingSizeLarge),


                  Row(children: [
                    Expanded(
                      child: Column(children: [
                        CustomTextField(
                          titleText: 'password'.tr,
                          hintText: 'password'.tr,
                          controller: authController.passwordSignUpController,
                          inputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          onChanged: (value){
                            if(value != null && value.isNotEmpty){
                              if(!authController.showPassView){
                                authController.showHidePass();
                              }
                            }else{
                              if(authController.showPassView){
                                authController.showHidePass();
                              }
                            }
                          },
                        ),

                        // authController.showPassView ? const PassView() : const SizedBox(),
                      ]),
                    ),


                  ]),
                  const SizedBox(height: Dimensions.paddingSizeLarge),


                  const SizedBox(height: Dimensions.paddingSizeLarge),

                  const SizedBox(height: Dimensions.paddingSizeLarge),

                  CustomButton(
                    buttonText: 'Sign Up'.tr,
                    isLoading: authController.isLoading,
                    onPressed:  () => authController.register(),
                  ),

                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('Already have account'.tr, style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),

                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteHelper.signIn);

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                        child: Text('Sign In'.tr, style: robotoMedium.copyWith(color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ]),

                ]),
              );
            }),
          ),
        ),
      )),
    );
  }

  void _register( AuthController authController){

  }
}
