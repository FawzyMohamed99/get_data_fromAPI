import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:traning/models/user_model.dart';
class ApiService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/comments?postId=1';
  final http.Client httpClient = http.Client();

  Future<List<UserModel>> getItems() async {
    final response = await httpClient.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final items = data.map((json) => UserModel.fromJson(json)).toList();
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }
}