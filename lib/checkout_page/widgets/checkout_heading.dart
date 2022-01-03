import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({ Key? key, required this.number, required this.name }) : super(key: key);

  final String number;
   final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            top: 20,
          ),
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20,
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}