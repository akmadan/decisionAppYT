import 'package:decisionlite/services/functions/authFunctions.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var username = '';
  bool isLoginPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(14),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoginPage
                    ? Container()
                    : TextFormField(
                        validator: (value) {
                          if (value!.length == 0) {
                            return 'Enter username';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          username = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        key: ValueKey('username'),
                        decoration: InputDecoration(
                            labelText: 'Enter Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide())),
                      ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length == 0) {
                      return 'Enter email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('email'),
                  decoration: InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide())),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.length == 0) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide())),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // print(email);
                          // print(password);
                          // print(username);
                          isLoginPage
                              ? signinUser(context, email, password)
                              : signupUser(context, email, password, username);
                        }
                      },
                      child: Text(isLoginPage ? 'Login' : 'Signup')),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLoginPage = !isLoginPage;
                      });
                    },
                    child: Text(isLoginPage ? 'Signup' : 'Login'))
              ],
            )),
      ),
    );
  }
}
