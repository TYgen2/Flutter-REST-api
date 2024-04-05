// All todo api call placed here

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class TodoService {
  static Future<bool> deleteByID(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final response = await http.delete(Uri.parse(url));

    return response.statusCode == 200;
  }

  static Future<List?> fetechTodos() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;

      return result;
    } else {
      return null;
    }
  }

  static Future<bool> updateTodo(String id, Map body) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final response = await http.put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return response.statusCode == 200;
  }

  static Future<bool> addTodo(Map body) async {
    const url = 'https://api.nstack.in/v1/todos';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return response.statusCode == 201;
  }
}
