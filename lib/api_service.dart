import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_api_demo/model/user.dart';

class ApiService {
  static const String _baseUrl = 'https://randomuser.me/api/';

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['results'] as List;
      return jsonData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<User> getUserByUsername(String username) async {
    final response = await http.get(Uri.parse('$_baseUrl?username=$username'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['results'][0];
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
