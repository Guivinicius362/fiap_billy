import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

const baseURL = "http://192.168.15.9:8080/user";

class AuthRepository {
  final sharedPrefs = _getIt<SharedPreferences>();

  Future<int> login(String email, String password) async {
    final uri = Uri.parse(
      '${baseURL}/signin',
    );
    print('a');

    final response = await http.post(
      uri,
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final json = jsonDecode(response.body);
    final token = json['content']['token'] as String;
    sharedPrefs.setString('token', token);

    return response.statusCode;
  }

  Future<int> register({
    required String name,
    required String email,
    required String password,
    required String address,
    required String birthdate,
  }) async {
    final uri = Uri.parse('${baseURL}/signup');
    final response = await http.post(
      uri,
      body: jsonEncode(
        {
          'name': name,
          'email': email,
          'address': address,
          'birthdate': birthdate,
          'password': password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final json = jsonDecode(response.body);
    final token = json['content']['token'] as String;
    sharedPrefs.setString('token', token);
    return response.statusCode;
  }

  Future<int> recoverRequest({
    required String email,
  }) async {
    final uri = Uri.parse('${baseURL}/recoverRequest');
    final response = await http.post(
      uri,
      body: jsonEncode(
        {
          'email': email,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return response.statusCode;
  }

  Future<int> PasswordRecovery({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    final uri = Uri.parse('${baseURL}/passwordRecovery');
    final response = await http.post(
      uri,
      body: jsonEncode(
        {
          'email': email,
          'verificationCode': verificationCode,
          'newPassword': newPassword
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return response.statusCode;
  }
}
