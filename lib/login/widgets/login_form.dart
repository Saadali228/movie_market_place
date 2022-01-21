import 'package:flutter/material.dart';
import 'package:movie_market_place/login/widgets/login_clipper.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LoginClipper(),
      child: Container(
        color: const Color(0xff302c3c),
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          ],
        ),
      ),
    );
  }
}
