import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Services {
  final String serverUrl = "http://10.0.2.2:3000/api/";
  static Services _instance;
  factory Services() => _instance ??= new Services._();

  Services._();

  var storage = new FlutterSecureStorage();
  Future<void> setStorage(String val) async {
    await storage.write(key: "uid", value: val);
  }

  loginUser(Map<String, dynamic> obj) async {
    var response =
        await http.post(Uri.parse(serverUrl + "users/login"), body: obj);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      if (result['success']) {
        return result;
      } else {
        return null;
      }
    } else {
      return false;
    }
  }

  registerUser(Map<String, dynamic> obj) async {
    var response =
        await http.post(Uri.parse(serverUrl + "users/register"), body: obj);
    print(response.body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result['success']) {
        return result;
      }
    }
  }
}
