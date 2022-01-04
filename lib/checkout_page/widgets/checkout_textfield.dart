import 'package:flutter/material.dart';

class CheckoutTextField extends StatelessWidget {
  const CheckoutTextField({
    Key? key,
    required this.name,
    required this.error,
    required this.initialValue,
    required this.onChanged,
    this.obsecure,
    this.width,
  }) : super(key: key);

  final String name;
  final String? error;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool? obsecure;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.20,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
        ),
        child: TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          style: const TextStyle(
            color: Colors.white,
          ),
          obscureText: obsecure ?? false,
          decoration: InputDecoration(
            isDense: true,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            labelText: name,
            errorText: error,
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
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
