import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

const baseURL = "http://192.168.15.9:8080";

class CustomHttpClient {
  final sharedPrefs = _getIt<SharedPreferences>();

  Future<http.Response> get({required String url, Map? headers}) async {
    final uri = Uri.parse('${baseURL}/${url}');
    final token = sharedPrefs.getString('token');
    return await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token!,
      },
    );
  }

  Future<http.Response> delete(String url, Map headers) async {
    final uri = Uri.parse('${baseURL}/${url}');
    final token = sharedPrefs.getString('token');
    return await http.delete(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token!,
      },
    );
  }

  Future<http.Response> post(String url, Map headers, Object? body) async {
    final uri = Uri.parse('${baseURL}/${url}');
    final token = sharedPrefs.getString('token');
    return await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token!,
      },
      body: body,
    );
  }
}
