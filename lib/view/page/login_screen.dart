import 'package:flutter/material.dart';
import 'package:login_feature/model/user_model.dart';
import 'package:login_feature/view/page/profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = '';
  String _password = '';
  String _errorTextUsername = '';
  String _errorTextPassword = '';
  String _errorLogin = '';

  void clearErrorText() {
    setState(() {
      _errorTextUsername = '';
      _errorTextPassword = '';
      _errorLogin = '';
    });
  }

  bool isValidLogin() {
    bool isValid = false;

    for (UserModel user in userData) {
      if (user.username == _username && user.password == _password) {
        isValid = true;
      }
    }

    return isValid;
  }

  UserModel getUserData(String username) {
    for (UserModel user in userData) {
      if (user.username == _username && user.password == _password) {
        return user;
      }
    }

    return UserModel(
        username: '',
        password: '',
        fullName: '',
        photoProfile: '',
        address: '',
        email: '',
        phone: '',
        desc: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            )),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Input Username Here',
                errorText: _errorTextUsername == '' ? null : _errorTextUsername,
              ),
              onChanged: (String value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Input Password Here',
                labelText: 'Password',
                errorText: _errorTextPassword == '' ? null : _errorTextPassword,
              ),
              onChanged: (String password) {
                _password = password;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _errorLogin,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  clearErrorText();
                  if (_username == '') {
                    setState(() {
                      _errorTextUsername = 'Username wajib di isi';
                    });
                  } else if (_password == '') {
                    setState(() {
                      _errorTextPassword = 'Password wajib di isi';
                    });
                  } else {
                    bool isValidLogin = this.isValidLogin();

                    if (isValidLogin) {
                      UserModel user = getUserData(_username);
                      print('Successfully Login');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfileScreen(user: user);
                      }));
                    } else {
                      setState(() {
                        _errorLogin = "Login Failed.";
                      });
                      print('Login Failed');
                    }
                  }
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
