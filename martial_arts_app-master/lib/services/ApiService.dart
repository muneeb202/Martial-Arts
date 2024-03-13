import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static String baseURI = 'http://192.168.1.3:3000/';

  static Future<int> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedUser = prefs.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    return userDict['id'];
  }

  static Future<bool> createUser(
      String fullName, String userName, String email, String password) async {
    final url = Uri.parse(baseURI + 'signup');
    final data = jsonEncode({
      'fullname': fullName,
      'username': userName,
      'email': email,
      'points': 0,
      'streaks': 0,
      'password': password,
    });
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(url, headers: headers, body: data);
    log(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', data);
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', response.body);
    if (response.statusCode == 500 || response.statusCode == 401) {
      return false;
    }
    return true;
  }

  static Future<bool> check_activity(String activity) async {
    int id = await getUserID();

    final url = Uri.parse(baseURI + 'add-activity');
    final data = {
      'user_id': id,
      'activity': activity,
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

  static Future<Set> get_activities() async {
    int id = await getUserID();
    final url = Uri.parse(baseURI + 'activities/' + id.toString());
    final headers = {'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);
    log(response.body);
    List responseList = jsonDecode(response.body);

    // Extract the 'activity' values into a set
    Set activitySet = responseList.map((item) => item['activity']).toSet();

    return activitySet;
  }
}
