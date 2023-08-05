import 'package:billy/shared/repositories/auth_repository.dart';
import 'package:billy/shared/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

final _getIt = GetIt.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    final token = _getIt<SharedPreferences>().getString('token');
    if (token != null)
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popAndPushNamed("home");
      });
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) => null,
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to create account screen
                    Navigator.pushNamed(context, 'password_recovery');
                  },
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                _getIt<AuthRepository>().login(email, password).then(
                      (statusCode) => {
                        if (statusCode == 200)
                          {
                            Navigator.popAndPushNamed(context, 'home'),
                          }
                        else
                          {
                            showToast(context),
                          }
                      },
                    );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Or',
              style: TextStyle(fontSize: 12),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('Create Account'),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
