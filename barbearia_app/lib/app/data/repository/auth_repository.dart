import 'dart:convert';

import 'package:barbearia_app/app/data/model/auth_model.dart';
import 'package:barbearia_app/app/data/model/user_model.dart';
import 'package:barbearia_app/app/data/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login(String username, String password) async {
    Map json = await apiClient.login(username, password);
    return Auth.fromJson(json);
  }

  Future<User> register(String username, String password) async {
    Map json = await apiClient.register(username, password);
    return User.fromJson(json['user']);
  }
}
