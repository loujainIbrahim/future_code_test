import 'dart:ui';

import 'cache_helper.dart';

final mainColor=Color(0xff272739);
String? token;
String gettoken() {
  var token = CacheHelper.getData(key: 'token');
  print("*******the value toke is $token");
  return token;
}