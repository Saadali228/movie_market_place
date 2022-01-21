import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1), BlendMode.dstATop),
          alignment: Alignment.centerRight,
          fit: BoxFit.fitHeight,
          image: const AssetImage('assets/movies.jpg'),
        ),
      ),
    );
  }
}
