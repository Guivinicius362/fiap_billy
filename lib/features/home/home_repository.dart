import 'dart:convert';

import 'package:billy/features/home/home_model.dart';
import 'package:billy/features/home/notification.dart';
import 'package:billy/shared/custom_http_client.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
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

class NotificationsBloc {
  final client = _getIt<CustomHttpClient>();
  final _notificationsSubject = BehaviorSubject<List<NotificationModel>>();

  Stream<List<NotificationModel>> get notificationsStream =>
      _notificationsSubject.stream;

  void fetchNotifications() {
    client.get(url: 'notification').then((response) {
      final body = jsonDecode(response.body) as List<dynamic>;
      final notifications =
          body.map((e) => NotificationModel.fromJson(e)).toList();
      _notificationsSubject.add(notifications);
    });
  }

  void dispose() {
    _notificationsSubject.close();
  }
}
