import 'dart:convert';
import 'package:gymnation/api/meAPI.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  final String apiUrl = dotenv.env['API_URL'].toString();
  final meAPI meapi = meAPI();

  // Fungsi untuk update profile
  Future<bool> updateProfile({
    required int idUser,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      return false;
    }

    final url = Uri.parse('$apiUrl/user/updateProfile/$idUser');

    try {
      final body = {
        "id_user": idUser,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
      };

      final response = await http.put(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Response from server: $responseData');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false; // Return false jika ada error
    }
  }
}
