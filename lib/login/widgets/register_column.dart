import 'package:flutter/material.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/login/widgets/login_textfield.dart';

class RegisterColumn extends StatelessWidget {
  const RegisterColumn({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.width,
    required TextEditingController fName,
    required TextEditingController lName,
    required TextEditingController email,
    required TextEditingController password,
    required this.toggle,
  })  : _formKey = formKey,
        _fName = fName,
        _lName = lName,
        _email = email,
        _password = password,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double width;
  final TextEditingController _fName;
  final TextEditingController _lName;
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
          'START FOR FREE',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 30,
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
              TextSpan(text: 'Create new account'),
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
              'Already A Member?',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                toggle();
              },
              child: const Text(
                'Log In',
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
              Row(
                children: [
                  LoginTextfield(
                    width: width * 0.242,
                    controller: _fName,
                    obscure: false,
                    label: 'First Name',
                    icon: Icons.person,
                  ),
                  const SizedBox(width: 20),
                  LoginTextfield(
                    width: width * 0.242,
                    controller: _lName,
                    obscure: false,
                    label: 'Last Name',
                    icon: Icons.person,
                  ),
                ],
              ),
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
              ElevatedButton(
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
                  'Create Account',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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
