import 'package:flutter/material.dart';
import 'package:movie_market_place/login/widgets/login_mobile_column.dart';
import 'package:movie_market_place/login/widgets/register_mobile_column.dart';

class LoginMobileForm extends StatefulWidget {
  const LoginMobileForm({Key? key}) : super(key: key);

  @override
  State<LoginMobileForm> createState() => _LoginMobileFormState();
}

class _LoginMobileFormState extends State<LoginMobileForm> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    final _fName = TextEditingController();
    final _lName = TextEditingController();
    final _email = TextEditingController();
    final _password = TextEditingController();
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