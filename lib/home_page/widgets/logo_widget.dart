import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.movie),
        SizedBox(
          width: 8.0,
        ),
        Text("MovieLOO"),
      ],
    );
  }
}