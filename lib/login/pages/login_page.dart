import 'package:flutter/material.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/login/widgets/background_image.dart';
import 'package:movie_market_place/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static const loginPageRoute = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              LogoWidget(),
            ],
          ),
        ),
        backgroundColor: const Color(0xff302c3c),
        body: Stack(
          children: const [
            BackgroundImage(),
            LoginForm(),
          ],
        ));
  }
}
