import 'package:flutter/material.dart';
import 'package:movie_market_place/login/widgets/login_clipper.dart';
import 'package:movie_market_place/login/widgets/login_column.dart';
import 'package:movie_market_place/login/widgets/register_column.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
    final TextEditingController _fName = TextEditingController();
    final TextEditingController _lName = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final _formKey = GlobalKey<FormState>();
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  void dispose() {
    _fName.dispose();
    _lName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: LoginClipper(),
      child: Container(
        color: const Color(0xff302c3c),
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * 0.7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: showSignIn
              ? RegisterColumn(
                  formKey: _formKey,
                  width: mWidth,
                  fName: _fName,
                  lName: _lName,
                  email: _email,
                  password: _password,
                  toggle: toggleView,
                )
              : LoginColumn(
                  formKey: _formKey,
                  width: mWidth,
                  email: _email,
                  password: _password,
                  toggle: toggleView,
                ),
        ),
      ),
    );
  }
}
