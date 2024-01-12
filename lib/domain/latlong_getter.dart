import 'dart:convert';
import 'dart:developer';

import 'package:fastride/constant/api_key.dart';
import 'package:http/http.dart';

class LatLongGetter {
  static String key = apiKey;
  static String baseUrl = "https://api.api-ninjas.com/v1/geocoding?city=";
  static Future<Map<String, dynamic>?> locationLatLongGetter(
      {required String location}) async {
    try {
      Response response = await get(Uri.parse(baseUrl + location), headers: {
        "X-Api-Key": apiKey,
      });
      if (response.statusCode == 200) {
        List<dynamic> json = await jsonDecode(response.body);
        Map<String, dynamic> data = json[0];

        return data;
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }
}
