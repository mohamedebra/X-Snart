// ignore_for_file: constant_identifier_names

import '../model/language_model.dart';

String? langStart;
String? shareLink;

class AppConstants {
  static const String appName = 'Yalla Go';
  static const double appVersion = 1.0;

  static const String fontFamily = 'IBMPlexSansArabic-Regular';

  static const String appBaseUrl = 'https://compoundw.lisre.online/api/';

  static const String isOwner = 'owner';
  static const String isUser = 'visitor';
  static const String isTenant = 'tenant';
  static const String isCompany = 'campany';
  static const String isSecurityMan = 'security_man';
  static int connectTimeout = 20 * 1000;
  static int sendTimeout = 20 * 1000;
  static int receiveTimeout = 20 * 1000;
  static const String appBaseUrlImages =
      'https://compoundw.lisre.online/public/storage/';

  // Shared Key

  static const String THEME = 'Compound_theme';
  static const String TOKEN = 'Compound_token';
  static const String COUNTRY_CODE = 'Compoundcountry_code';
  static const String LANGUAGE_CODE = 'Compoundlanguage_code';
  static const String USER_PASSWORD = 'Compounduser_password';
  static const String USER_ADDRESS = 'Compounduser_address';
  static const String USER_NUMBER = 'Compounduser_number';
  static const String USER_COUNTRY_CODE = 'Compoundcountry_code';
  static const String NOTIFICATION = 'Compoundnotification';
  static const String NOTIFICATION_COUNT = 'Compoundnotification_count';
  static const String IGNORE_LIST = 'Compoundignore_list';
  static const String TOPIC = 'all_zone_delivery_man';
  static const String ZONE_TOPIC = 'zone_topic';
  static const String LOCALIZATION_KEY = 'X-localization';

  static List<LanguageModel> languages = [
    LanguageModel(languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
    LanguageModel(
        languageName: 'English', countryCode: 'US', languageCode: 'en'),

    // LanguageModel(imageUrl: Images.arabic, languageName: 'Spanish', countryCode: 'ES', languageCode: 'es'),
    // LanguageModel(imageUrl: Images.bengali, languageName: 'Bengali', countryCode: 'BN', languageCode: 'bn'),
  ];
}
