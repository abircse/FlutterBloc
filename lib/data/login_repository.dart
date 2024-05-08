import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginRepository {

  final _url = "https://reqres.in/api/login";

  Future<dynamic> userLogin(requestBody) async {
    try{
      final response = await http.post(Uri.parse(_url), body: requestBody);
      final body = response.body;
      final json = jsonDecode(body);
      if (kDebugMode) {
        print(json['token']);
      }
      return json['token'].toString();
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
}