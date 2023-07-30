import 'package:billy/shared/repositories/auth_repository.dart';
import 'package:billy/shared/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  DateTime _selectedDate = DateTime.now(); // To store the selected birthdate

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime initialDate = _selectedDate;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _register() async {
    String email = _emailController.text;
    String birthdate = _selectedDate.toString().substring(0, 10);
    String address = _addressController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Implement your registration logic here
    // Check if the entered password meets the required criteria, and confirm if passwords match

    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Passwords do not match.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: _selectedDate != null
                        ? TextEditingController(
                            text: _selectedDate.toString().substring(0, 10))
                        : TextEditingController(),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Birthdate (YYYY-MM-DD)',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _addressController,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  labelText: 'Address (Brazilian Format)',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and one digit.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
