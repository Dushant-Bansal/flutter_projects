import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/data.dart';

class Api {
  static Future<Data> fetchPosts(int page) async {
    final response = await http.get(
        Uri.parse('https://internship-service.onrender.com/videos?page=$page'));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body["message"] == "Success") {
        return Data.fromJson(body["data"]);
      }
      throw Exception('Message not success');
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
