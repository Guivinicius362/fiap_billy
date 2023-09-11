import 'package:billy/features/profile/profile_bloc.dart';
import 'package:billy/features/profile/profile_user.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

class ProfileScreen extends StatelessWidget {
  final ProfileBloc _profileBloc = _getIt<ProfileBloc>();
  @override
  Widget build(BuildContext context) {
    _profileBloc.fetchProfile();
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                  'https://example.com/profile_image.jpg', // Substitua pela URL da imagem do perfil real
                ),
              ),
            ),
            SizedBox(height: 16),
            StreamBuilder<ProfileUser>(
              stream: _profileBloc.profileStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final user = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(user.name, style: TextStyle(fontSize: 16)),
                      SizedBox(height: 16),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(user.email, style: TextStyle(fontSize: 16)),
                      SizedBox(height: 16),
                      Text(
                        'Birthdate:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(user.birthdate.toLocal().toString(),
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _getIt<SharedPreferences>().clear();
                          },
                          child: Text('Logout'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
