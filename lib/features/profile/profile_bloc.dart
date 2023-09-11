import 'dart:convert';

import 'package:billy/features/profile/profile_user.dart';
import 'package:billy/shared/custom_http_client.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

final _getIt = GetIt.instance;

class ProfileBloc {
  final client = _getIt<CustomHttpClient>();

  final _userSubject = BehaviorSubject<ProfileUser>();
  Stream<ProfileUser> get profileStream => _userSubject.stream;

  void fetchProfile() => client.get(url: 'profile').then(
        (response) => _userSubject.add(
          ProfileUser.fromJson(
            jsonDecode(response.body),
          ),
        ),
      );

  void dispose() {
    _userSubject.close();
  }
}
