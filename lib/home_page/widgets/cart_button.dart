import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "1",
            style: TextStyle(fontSize: 10.0),
          ),
          SizedBox(
            width: 2.0,
          ),
          Icon(
            Icons.shopping_cart_rounded,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}