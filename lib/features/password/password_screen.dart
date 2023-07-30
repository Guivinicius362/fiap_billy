import 'package:flutter/material.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  late String _email;
  late String _verificationCode;
  late String _newPassword;
  bool _showEmailSection = true;

  void _sendEmail() {
    // TODO: Implement the logic to send the recovery email
    // Replace this with your actual implementation

    setState(() {
      _showEmailSection = false;
    });
  }

  void _resetPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Password Reset Successful'),
          content: Text('Your password has been reset successfully.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Recovery'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: _showEmailSection
            ? _buildEmailSection()
            : _buildVerificationSection(),
      ),
    );
  }

  Widget _buildEmailSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (value) {
            _email = value;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: _sendEmail,
          child: Text('Send Email'),
        ),
      ],
    );
  }

  Widget _buildVerificationSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (value) {
            _verificationCode = value;
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Verification Code',
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          onChanged: (value) {
            _newPassword = value;
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'New Password',
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: _resetPassword,
          child: Text('Reset Password'),
        ),
      ],
    );
  }
}
