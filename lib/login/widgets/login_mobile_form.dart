import 'package:flutter/material.dart';
import 'package:movie_market_place/login/widgets/login_mobile_column.dart';
import 'package:movie_market_place/login/widgets/register_mobile_column.dart';

class LoginMobileForm extends StatefulWidget {
  const LoginMobileForm({Key? key}) : super(key: key);

  @override
  State<LoginMobileForm> createState() => _LoginMobileFormState();
}

class _LoginMobileFormState extends State<LoginMobileForm> {
    final TextEditingController _fName = TextEditingController();
    final TextEditingController _lName = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
   final  _formKey = GlobalKey<FormState>();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: showSignIn
          ? RegisterMobileColumn(
              formKey: _formKey,
              width: mWidth,
              fName: _fName,
              lName: _lName,
              email: _email,
              password: _password,
              toggle: toggleView,
            )
          : LoginMobileColumn(
              formKey: _formKey,
              width: mWidth,
              email: _email,
              password: _password,
              toggle: toggleView,
            ),
    );
  }
}