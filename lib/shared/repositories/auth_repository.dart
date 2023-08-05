import 'package:http/http.dart' as http;

class AuthRepository {
  Future<int> login(String email, String password) async {
    // final uri = Uri.parse('htpp://google.com.br');
    // final response =
    //    await http.post(uri, body: {'email': email, 'password': password});

    return 201;
  }

  Future<int> register(
    String name,
    String email,
    String password,
    String address,
    String birthdate,
  ) async {
    final uri = Uri.parse(
      'http://localhost:8080/user/signup/',
    );
    final response = await http.post(uri, body: {
      'name': name,
      'email': email,
      'address': address,
      'birthdate': birthdate,
      'password': password,
    }, headers: {
      'Content-Type': ' application/json'
    });

    return response.statusCode;
  }
}
