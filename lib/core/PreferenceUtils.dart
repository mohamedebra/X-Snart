// ignore_for_file: file_names, unused_import, constant_identifier_names, unused_element

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;

// ignore: avoid_classes_with_only_static_members
class PreferenceUtils {
  static const PREF_CACHETIME = 'cachedProductTime';
  static const TOKEN = 'TOKEN';
  static const MacAddress = 'MacAddress';
  static const UserName = 'UserName';
  static const UserCode = 'UserCode';
  static const Connectivity = 'Connectivity';

  static const ISLOGIN = 'ISLOGIN';
  static const Name = 'Name';
  static const EmailUser = 'EmailUser';
  static const IsOwner = 'Owner';
  static const IsUser = 'IsUser ';
  static const IsCompany = 'IsCompany';
  static const ISDashboard = 'ISDashboard';
  static const companyType = 'companyType';
  static const ImageUser = 'ImageUser';
  static const IdUser = 'IdUser';
  static const QrCodePath = 'QrCodePath';

  static Future<SharedPreferences> get _instance async =>
      prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? prefs;

  static Future<SharedPreferences> init() async {
    prefs = await _instance;
    return prefs!;
  }

  static String getName() {
    return prefs?.getString(Name) ?? '';
  }

  static String getEmailUser() {
    return prefs!.getString(EmailUser) ?? '';
  }


  static Future<bool> setImageUser(String value) async {
    var prefs = await _instance;
    return prefs.setString(ImageUser, value);
  }
  static Future<bool> setId(String value) async {
    print(value);
    var prefs = await _instance;
    return prefs.setString(IdUser, value);
  }

  static String getId() {
    return prefs?.getString(IdUser) ?? '0';
  }


  static String getImageUser() {
    return prefs!.getString(ImageUser) ?? '';
  }

  static String getIsOwner() {
    return prefs!.getString(IsOwner) ?? '';
  }

  static String getIsCompany() {
    return prefs!.getString(IsCompany) ?? '';
  }

  static String getCompanyType() {
    return prefs!.getString(companyType) ?? '';
  }

  static String getIsUser() {
    return prefs!.getString(IsUser) ?? '';
  }

  static Future<bool> setName(String value) async {
    var prefs = await _instance;
    return prefs.setString(Name, value);
  }

  static Future<bool> setEmailUser(String value) async {
    var prefs = await _instance;
    return prefs.setString(EmailUser, value);
  }

  static Future<bool> setIsOwner(String value) async {
    var prefs = await _instance;
    return prefs.setString(IsOwner, value);
  }

  static Future<bool> setQrCodePath(String value) async {
    var prefs = await _instance;
    return prefs.setString(QrCodePath, value);
  }


  static String getQrCodePath() {
    return prefs!.getString(QrCodePath) ?? '';
  }


  static Future<bool> setCompanyType(String value) async {
    var prefs = await _instance;
    return prefs.setString(companyType, value);
  }

  static Future<bool> setIsUser(String value) async {
    var prefs = await _instance;
    return prefs.setString(IsUser, value);
  }

  static Future<bool> setIsCompany(String value) async {
    var prefs = await _instance;
    return prefs.setString(IsCompany, value);
  }

  static Future<bool> setDashboardLink(String value) async {
    var prefs = await _instance;
    return prefs.setString(ISDashboard, value);
  }

  static String? getDashboardLink() {
    return prefs?.getString(ISDashboard);
  }

  static String getToken() {
    return prefs!.getString(TOKEN) ?? '';
  }

  static Future<bool> setToken(String value) async {
    var prefs = await _instance;
    return prefs.setString(TOKEN, value);
  }

  static Future<bool> setMacAddress(String value) async {
    var prefs = await _instance;
    return prefs.setString(MacAddress, value);
  }

  static String getMacAddress() {
    return prefs!.getString(MacAddress) ?? '';
  }

  static Future<bool> setConnectivity(List<String> value) async {
    var prefs = await _instance;
    return prefs.setStringList(Connectivity, value);
  }

  static Future<List<String>?> getConnectivity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(Connectivity);
  }

  static String getSelectedUserName() {
    String? selectedPries = prefs?.getString(UserName);
    return selectedPries ?? '';
  }

  static Future<bool> setSelectedUserName(String value) async {
    var prefs = await _instance;
    return prefs.setString(UserName, value);
  }

  static int getSelectedUserCode() {
    int? selectedPries = prefs?.getInt(UserCode);
    return selectedPries ?? 0;
  }

  static Future<bool> setSelectedUserCode(int value) async {
    var prefs = await _instance;
    return prefs.setInt(UserCode, value);
  }

  static Future<bool> setLogin(bool value) async {
    var prefs = await _instance;
    return prefs.setBool(ISLOGIN, value);
  }

  static Future<bool> isLogin() async {
    var prefs = await _instance;
    return prefs.getBool(ISLOGIN) ?? false;
  }

  static Future<bool> _setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static Future<bool> _setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> _setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool _getBool(String key) {
    return prefs!.getBool(key) ?? true;
  }

  static int _getInt(String key) {
    return prefs!.getInt(key) ?? 0;
  }

  static Future<void> clearAllPreferences() async {
    prefs!.clear();
  }

  static int getCacheTime() {
    return _getInt(PREF_CACHETIME);
  }

  static void setCacheTime(int time) {
    _setInt(PREF_CACHETIME, time);
  }
}
