import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  const LoginTextfield(
      {Key? key,
      this.width,
      required this.controller,
      required this.obscure,
      required this.label,
      required this.icon})
      : super(key: key);

  final double? width;
  final TextEditingController controller;
  final bool obscure;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mobile = 600;
    return SizedBox(
      width: size.width > mobile ? width ?? size.width * 0.5 : size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: controller,
          obscureText: obscure,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This Field is Required!';
            }
          },
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff383444),
            label: Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.only(left: 20.0),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(icon, color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
