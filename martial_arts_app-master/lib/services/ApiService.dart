import 'dart:developer';
import 'dart:io';
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
      'password': password,
    });
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(url, headers: headers, body: data);
    log(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', response.body);
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

  static Future<bool> check_activity(String activity, String answer) async {
    int id = await getUserID();

    final url = Uri.parse(baseURI + 'add-activity');
    final data = {'user_id': id, 'activity': activity, 'answer': answer};
    final headers = {'Content-Type': 'application/json'};

    final response =
        await http.post(url, headers: headers, body: jsonEncode(data));
    log(response.body);
    if (response.statusCode == 500 || response.statusCode == 401) {
      return false;
    }
    return true;
  }

  static Future<Map<int, String>> get_activities() async {
    int id = await getUserID();
    final url = Uri.parse(baseURI + 'activities/' + id.toString());
    final headers = {'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);
    log(response.body);
    List responseList = jsonDecode(response.body);

    // Extract the 'activity' values into a set
    Map<int, String> activityMap = {};
    for (var item in responseList) {
      int activity = item['activity'];
      String answer = item['answer'] ?? "";
      activityMap[activity] = answer;
    }

    return activityMap;
  }

  static Future<Map<int, int>> get_all_activities() async {
    int id = await getUserID();
    final url = Uri.parse(baseURI + 'activities/' + id.toString());
    final headers = {'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);
    log(response.body);
    List responseList = jsonDecode(response.body);

    // Extract the 'activity' values into a set
    Map<int, int> activityMap = {};
    for (var item in responseList) {
      int activity = item['activity'];
      int answer = item['count'];
      activityMap[activity] = answer;
    }

    return activityMap;
  }

  static Future<void> uploadImage(File imageFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseURI + 'upload-image'),
    );
    String fileName = imageFile.path.split('/').last;
    request.files.add(http.MultipartFile(
      'image',
      imageFile.readAsBytes().asStream(),
      imageFile.lengthSync(),
      filename: fileName,
    ));
    int id = await getUserID();
    request.fields['user_id'] = id.toString();

    var response = await request.send();
    if (response.statusCode == 200) {
      log('Image uploaded successfully');
    } else {
      log('Failed to upload image');
    }
  }

  static Future<File?> fetchProfilePicture() async {
    int id = await getUserID();
    final response =
        await http.get(Uri.parse(baseURI + 'profilepic/' + id.toString()));

    if (response.statusCode == 200) {
      // Decode the image data
      List<int> imageBytes = response.bodyBytes;

      // Write the image data to a temporary file
      String tempPath = Directory.systemTemp.path;
      File tempFile = File('$tempPath/profile_picture.jpg');
      await tempFile.writeAsBytes(imageBytes);

      return tempFile;
    } else {
      // Handle error
      print('Failed to load profile picture: ${response.statusCode}');
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> fetchTopUsersByStreaks() async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.get(Uri.parse(baseURI + 'users/top-10-streaks'),
        headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((user) => {
                'fullname': user['fullname'],
                'streaks': user['streaks'].toString()
              })
          .toList();
    } else {
      throw Exception('Failed to load top users by streaks');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchTopUsersByPoints() async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.get(Uri.parse(baseURI + 'users/top-10-points'),
        headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((user) => {
                'fullname': user['fullname'],
                'points': user['points'].toString()
              })
          .toList();
    } else {
      throw Exception('Failed to load top users by points');
    }
  }
}
