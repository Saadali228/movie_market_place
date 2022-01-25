import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars(this.star, {Key? key}) : super(key: key);

  final int star;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index + 1 <= star ? Colors.yellow : Colors.grey,
        ),
      ),
    );
  }
}
