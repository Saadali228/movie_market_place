import 'package:flutter/material.dart';
import 'package:movie_market_place/login/widgets/background_image.dart';
import 'package:movie_market_place/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static const loginPageRoute = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff302c3c),
        body: Stack(
          children: const [
            BackgroundImage(),
            LoginForm(),
          ],
        ));
  }
}
