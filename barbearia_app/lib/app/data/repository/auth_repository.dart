import 'package:barbearia_app/app/data/model/auth_model.dart';
import 'package:barbearia_app/app/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login(String username, String password) async {
    Map json = await apiClient.login(username, password);
    return Auth.fromJson(json);
  }
}
