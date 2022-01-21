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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ConstrainedBox(
            //   constraints: BoxConstraints(
            //       maxWidth: MediaQuery.of(context).size.width * 6 / 15),
            //   child: const Text(
            //     'Testing clipping with soft wrap',
            //     softWrap: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
