import 'package:barbearia_app/app/data/model/user_model.dart';

class Auth {
  User user;
  String accessToken;

  Auth({this.user, this.accessToken});

  Auth.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user.toJson();
    }
    data['access_token'] = accessToken;
    return data;
  }
}
