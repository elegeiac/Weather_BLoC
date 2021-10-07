import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/model.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  static Future<Weather?> getWeather({String? city}) async {
    var uri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?q=$city&key=347fe6ead6e74f1080b113520212609');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      print('RESPONSE CODE: ${response.statusCode}');
      var decoded = json.decode(response.body);
      var data = Weather.fromJson(decoded);
      print(data);
      return data;
    }
    return null;
  }
}
