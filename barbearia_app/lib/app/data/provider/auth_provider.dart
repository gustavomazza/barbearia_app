import 'dart:convert';

import 'package:barbearia_app/app/data/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthApiClient {
  // final http.Client httpClient = http.Client();

  // Future<Map<String, dynamic>>
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + 'login'),
          body: {"username": username, "password": password});

      if (response.statusCode == 200) {
        print('status 200');
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        print('status 404');
        Get.defaultDialog(
          title: "Login",
          content: Text(
            json.decode(response.body)['message'],
            style: TextStyle(fontSize: 18),
          ),
        );
        print('erro-get: ' + response.body);
      }
    } catch (err) {
      print(err);
    }
    return null;
  }

  Future<Map<String, dynamic>> register(
      String username, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + 'register'),
          body: {"username": username, "password": password});

      if (response.statusCode == 200) {
        Get.defaultDialog(
          title: "Cadastro",
          content: Text(
            json.decode(response.body)['message'],
            style: const TextStyle(fontSize: 18),
          ),
        );
        return json.decode(response.body);
      } else {
        Get.defaultDialog(
          title: "Erro!",
          content: Text(
            json.decode(response.body)['message'],
            style: const TextStyle(fontSize: 18),
          ),
        );
        print('erro-get: ' + response.body);
      }
    } catch (err) {
      Get.defaultDialog(title: "Cadastro", content: Text("$err"));
      print(err);
    }
    return null;
  }
}
