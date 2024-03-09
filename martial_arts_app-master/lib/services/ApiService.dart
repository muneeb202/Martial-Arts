import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static String baseURI = 'http://192.168.1.6:3000/';

  static Future<bool> createUser(
      String fullName, String userName, String email, String password) async {
    final url = Uri.parse(baseURI + 'signup');
    final data = {
      'fullname': fullName,
      'username': userName,
      'email': email,
      'password': password,
    };
    final headers = {'Content-Type': 'application/json'};

    final response =
        await http.post(url, headers: headers, body: jsonEncode(data));
    log(response.body);
    if (response.statusCode == 500) {
      return false;
    }
    return true;
  }

  static Future<bool> loginUser(String userName, String password) async {
    final url = Uri.parse(baseURI + 'login');
    final data = {
      'username': userName,
      'password': password,
    };
    final headers = {'Content-Type': 'application/json'};

    final response =
        await http.post(url, headers: headers, body: jsonEncode(data));
    log(response.body);
    if (response.statusCode == 500 || response.statusCode == 401) {
      return false;
    }
    return true;
  }
}
