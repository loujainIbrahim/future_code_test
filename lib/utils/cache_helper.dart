import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future saveData //تستطيغ ان تحتفظ باي معلومة
      ({
    required String key,
    required dynamic value,
  }) async {
    if (value != null) {
      if (value is String) {
        return await sharedPreferences.setString(key, value);
      }
      if (value is int) {
        return await sharedPreferences.setInt(key, value);
      }
      if (value is bool) {
        return await sharedPreferences.setBool(key, value);
      }
      return await sharedPreferences.setDouble(key, value);
    }
  }

  static dynamic getData //تستطيع ان تاتي باي داتا
      ({required String key}) async {
    return await sharedPreferences.get(key);
  }

  static Future<bool> removeData(
      {required String key}) async //لمسح التوكين وتسجيل خروج
  {
    return await sharedPreferences.remove(key);
  }
}
