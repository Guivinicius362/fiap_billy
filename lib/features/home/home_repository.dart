import 'dart:convert';

import 'package:billy/features/home/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

const baseURL = "http://192.168.15.9:8080/home";

class HomeRepository {
  final sharedPrefs = _getIt<SharedPreferences>();

  Future<UserContent> home() async {
    final uri = Uri.parse(
      '${baseURL}',
    );
    final token = sharedPrefs.getString('token');
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token!,
      },
    );
    final json = jsonDecode(response.body);

    return HomeResponse.fromJson(json).content;
  }
}
