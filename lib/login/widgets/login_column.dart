import 'package:flutter/material.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/login/widgets/login_textfield.dart';

class LoginColumn extends StatelessWidget {
  const LoginColumn({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.width,
    required TextEditingController email,
    required TextEditingController password,
    required this.toggle,
  })  : _formKey = formKey,
        _email = email,
        _password = password,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double width;
  final TextEditingController _email;
  final TextEditingController _password;
  final Function toggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(text: 'Login your account'),
              TextSpan(
                text: '.',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 75.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text(
              'Need An Account?',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                toggle();
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginTextfield(
                controller: _email,
                obscure: false,
                label: 'Email',
                icon: Icons.mail,
              ),
              LoginTextfield(
                controller: _password,
                obscure: true,
                label: 'Password',
                icon: Icons.password,
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        HomeScreen.homePageRoute,
                      );
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(160, 40),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
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
