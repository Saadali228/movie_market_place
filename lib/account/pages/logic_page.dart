import 'package:flutter/material.dart';
import 'package:movie_market_place/home_page/widgets/backdrop_image.dart';
import 'package:movie_market_place/utils/constants.dart';

class LoginPage extends StatelessWidget {
  static const loginPageRoute = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: backgroundGradient,
        ),
        const BackDropImage(
          image: '/4OTYefcAlaShn6TGVK33UxLW9R7.jpg',
        ),
        Positioned(
          left: 100,
          top: 150,
          child: Column(
            children: [
              const Text(
                'Create New Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Material(
                child: TextFormField(
                  initialValue: 'vendian@venturedive.com',
                  // onChanged: onChanged,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    labelText: 'Username',
                    // errorText: error,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xff322043),
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xff1F0C3F),
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
