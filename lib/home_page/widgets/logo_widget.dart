import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.movie,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          "Movie Mart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
