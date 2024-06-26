import 'dart:developer';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static String baseURI = 'https://backendapi.masterybrandambassador.com/';
  // static String baseURI = 'http://192.168.1.10:3000/';

  static Future<int> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedUser = prefs.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    return userDict['id'];
  }

  static Future<int> createUser(
      String fullName, String userName, String email, String password) async {
    try {
      final url = Uri.parse(baseURI + 'signup');
      final data = jsonEncode({
        'fullname': fullName,
        'username': userName,
        'email': email,
        'password': password,
      });
      final headers = {'Content-Type': 'application/json'};
      final response = await http.post(url, headers: headers, body: data);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<int> loginUser(String userName, String password) async {
    final url = Uri.parse(baseURI + 'login');
    final data = {
      'username': userName,
      'password': password,
    };
    final headers = {'Content-Type': 'application/json'};
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(data));
      log(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', response.body);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<int> updatedInfo() async {
    int id = await getUserID();
    final url = Uri.parse(baseURI + 'user-info/' + id.toString());
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(url, headers: headers);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', response.body);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUser = prefs.getString('user');
    return storedUser != null;
  }

  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  static Future<bool> check_activity(
      String activity, String answer, bool completed) async {
    int id = await getUserID();

    final url = Uri.parse(baseURI + 'add-activity');
    final data = {
      'user_id': id,
      'activity': activity,
      'answer': answer,
      'completed': completed
    };
    final headers = {'Content-Type': 'application/json'};
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(data));
      log(response.body);
      if (response.statusCode == 500 || response.statusCode == 401) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<int, String>> get_activities() async {
    int id = await getUserID();
    final url = Uri.parse(baseURI + 'activities/' + id.toString());
    final headers = {'Content-Type': 'application/json'};
    try {
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
    } catch (e) {
      return Map();
    }
  }

  static Future<bool> GoogleSignIn(
      String name, String email, String photoURL, String password) async {
    final url = Uri.parse(baseURI + 'google-signup');
    final data = jsonEncode({
      'fullname': name,
      'username': email,
      'email': email,
      'password': password,
    });
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 500) {
        return false;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', response.body);

      if (photoURL.isEmpty) return true;

      final photo = Uri.parse(photoURL);
      http.Response response2 = await http.get(photo);
      if (response2.statusCode == 200) {
        // Create a file with a unique name for the downloaded image
        String fileName = photoURL.split('/').last;
        File imageFile = File('${Directory.systemTemp.path}/$fileName.png');

        // Write the image data to the file
        await imageFile.writeAsBytes(response2.bodyBytes);

        // Prepare the multipart request to upload the image
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(baseURI + 'upload-image'),
        );

        // Add the image file to the request
        request.files.add(
          http.MultipartFile(
            'image',
            imageFile.readAsBytes().asStream(),
            imageFile.lengthSync(),
            filename: fileName + '.png',
          ),
        );

        // Add user ID to the request
        int id = await getUserID();
        request.fields['user_id'] = id.toString();

        // Send the request
        try {
          request.send();
        } catch (e) {
          return false;
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<int, int>> get_all_activities() async {
    int id = await getUserID();
    final url = Uri.parse(baseURI + 'all-activities/' + id.toString());
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(url, headers: headers);
      log(response.body);
      List responseList = jsonDecode(response.body);

      // Extract the 'activity' values into a set
      Map<int, int> activityMap = {};
      for (int i = 1; i <= 12; i++) activityMap[i] = 0;

      for (var item in responseList) {
        int activity = item['activity'];
        int answer = item['count'];
        activityMap[activity] = answer;
      }

      return activityMap;
    } catch (e) {
      return Map();
    }
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
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        log('Image uploaded successfully');
      } else {
        log('Failed to upload image');
      }
    } catch (e) {
      return;
    }
  }

  static Future<File?> fetchProfilePicture() async {
    int id = await getUserID();
    try {
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
    } catch (e) {
      return null;
    }
  }

  static Future<List<dynamic>> fetchStreaks() async {
    int id = await getUserID();
    try {
      final response =
          await http.get(Uri.parse(baseURI + 'users/streaks/' + id.toString()));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load user streaks');
      }
    } catch (e) {
      return List.empty();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchTopUsersByStreaks() async {
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .get(Uri.parse(baseURI + 'users/top-10-streaks'), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((user) => {
                  'fullname': user['fullname'],
                  'streaks': user['streaks'].toString(),
                  'profilepic': user['profilepic'] != null
                      ? ApiService.baseURI + 'uploads/' + user['profilepic']
                      : null
                })
            .toList();
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchTopUsersByPoints() async {
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .get(Uri.parse(baseURI + 'users/top-10-points'), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((user) => {
                  'fullname': user['fullname'],
                  'points': user['points'].toString(),
                  'profilepic': user['profilepic'] != null
                      ? ApiService.baseURI + 'uploads/' + user['profilepic']
                      : null
                })
            .toList();
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }

  static Future<bool> deleteUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? data = pref.getString('user');
    final userDict = jsonDecode(data!); // Changed from jsonEncode to jsonDecode
    final userId = userDict['id']; // Changed from const to final
    final url = Uri.parse('$baseURI/delete_user/$userId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        // User and related activities deleted successfully
        pref.remove('user'); // Changed from removeString to remove
        return true;
      } else {
        // User not found or other error occurred
        return false;
      }
    } catch (e) {
      // Handle network errors
      return false;
    }
  }
}
