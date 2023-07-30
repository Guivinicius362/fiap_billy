import 'package:billy/shared/repositories/auth_repository.dart';
import 'package:billy/shared/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                _getIt<AuthRepository>().login(email, password).then(
                      (statusCode) => {
                        if (statusCode == 201)
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
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Navigate to create account screen
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('Create Account'),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Navigate to create account screen
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
