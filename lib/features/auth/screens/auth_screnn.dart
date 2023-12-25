import 'package:amazon_clone_try/common/widget/custom_button.dart';
import 'package:amazon_clone_try/common/widget/custom_textfield.dart';
import 'package:amazon_clone_try/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

enum auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _currentAuth = auth.signup;
  final _signupKey = GlobalKey<FormState>();
  final _signinKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthService authService = AuthService();

  void _onSignup() {
    authService.signup(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }

  void _onSignin() {
    authService.signIn(
      password: _passwordController.text,
      email: _emailController.text,
      context: context,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'welcome',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Column(
              children: [
                ListTile(
                    title: Text('Create a new Account'),
                    leading: Radio(
                      value: auth.signup,
                      groupValue: _currentAuth,
                      onChanged: (_) {
                        setState(() {
                          _currentAuth = auth.signup;
                        });
                      },
                    )),
                if (_currentAuth == auth.signup)
                  Form(
                    key: _signupKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            hintText: 'Name', controller: _nameController),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            hintText: 'Email', controller: _emailController),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            hintText: 'password',
                            controller: _passwordController),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: 'SignUp',
                            onClick: () {
                              if (_signupKey.currentState!.validate()) {
                                _onSignup();
                              }
                            })
                      ],
                    ),
                  ),
                ListTile(
                    title: Text('Sign-In'),
                    leading: Radio(
                      value: auth.signin,
                      groupValue: _currentAuth,
                      onChanged: (_) {
                        setState(() {
                          _currentAuth = auth.signin;
                        });
                      },
                    )),
                if (_currentAuth == auth.signin)
                  Form(
                    key: _signinKey,
                    child: Column(children: [
                      CustomTextField(
                          hintText: 'Email', controller: _emailController),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'password',
                          controller: _passwordController),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(text: 'SignIn', onClick: () {
                        if(_signinKey.currentState!.validate()){
                          _onSignin();
                        }
                      })
                    ]),
                  )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
