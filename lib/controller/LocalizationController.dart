// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/app_constants.dart';
import '../core/helper/chache_helper.dart';
import '../core/model/language_model.dart';
import '../core/widget/custom_snackbar.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  bool isSwitchedMobile = true;
  bool isSwitchedEmail = true;


  void changeSwitchedMobile(bool value) {
    isSwitchedMobile = value;
    update();

    if (isSwitchedMobile) {
      showCustomSnackBar('Mobile Notifications enabled'.tr,isError: false);
    } else {
      showCustomSnackBar('Mobile Notifications are closed.'.tr,isError: false);
    }
  }


  changeSwitchedEmail(value){
    isSwitchedEmail = value;
    update();


    if (isSwitchedEmail) {
      showCustomSnackBar('Email Notifications enabled'.tr,isError: false);
    } else {
      showCustomSnackBar('Email Notifications are closed.'.tr,isError: false);
    }
  }


  LocalizationController({
    required this.sharedPreferences,
  }) {
    loadCurrentLanguage();
  }
  final List<String> chooseLanguageList = [
    'arabic'.tr,
    'english'.tr,
  ];
  Locale _locale = Locale(AppConstants.languages[0].languageCode!,
      AppConstants.languages[0].countryCode);
  bool _isLtr = true;
  List<LanguageModel> _languages = [];

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<LanguageModel> get languages => _languages;

  Locale initLang = CacheHelper.getData(key: 'lang') == null
      ? Locale(AppConstants.languages[1].languageCode!)
      : Locale(CacheHelper.getData(key: 'lang'));

  void changeLocale(String codeLang) {
    Locale locale = Locale(codeLang);
    CacheHelper.savedata(key: 'lang', value: codeLang);
    Get.updateLocale(locale);
  }

  void setLanguage(Locale locale) {
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    Get.updateLocale(locale);
    saveLanguage(_locale);
    update();
  }

  void saveLanguage(Locale locale) async {
    sharedPreferences.setString(
        AppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  }

  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
            AppConstants.languages[1].languageCode!,
        sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.languages[1].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
