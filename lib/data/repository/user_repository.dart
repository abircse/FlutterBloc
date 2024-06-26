import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutterblocarchitecture/data/model/PostModel.dart';
import 'package:flutterblocarchitecture/data/model/UserModel.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<dynamic> userLogin(requestBody) async {
    const _url = "https://reqres.in/api/login";

    try {
      final response = await http.post(Uri.parse(_url), body: requestBody);
      final body = response.body;
      final json = jsonDecode(body);
      if (kDebugMode) {
        print(json['token']);
      }
      return json['token'].toString();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<dynamic> getUsers() async {
    const _url = "https://reqres.in/api/users";

    try {
      final response = await http.get(Uri.parse(_url));
      final body = response.body;
      final json = jsonDecode(body);
      if (kDebugMode) {
        print(json);
      }
      return UsersModel.fromJson(json);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<dynamic> userRegistration(requestBody) async {
    const _url = "https://reqres.in/api/register";

    try {
      final response = await http.post(Uri.parse(_url), body: requestBody);
      final body = response.body;
      final json = jsonDecode(body);
      if (kDebugMode) {
        print(json['id']);
      }
      return json['id'].toString();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<List<PostModel>> loadUserWithPagination(int page) async {
    String url = 'https://jsonplaceholder.typicode.com/posts?_limit=10&_page=${page}';
    final response = await http.get(Uri.parse(url));
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => PostModel.fromJson(json)).toList();
  }
}
