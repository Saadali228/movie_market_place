import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            FloatingActionButton.small(
              onPressed: onTap,
              child: const Icon(
                Icons.shopping_cart_rounded,
                size: 16.0,
              ),
            ),
            if (state.cartList.isNotEmpty)
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    state.cartList.length.toString(),
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
