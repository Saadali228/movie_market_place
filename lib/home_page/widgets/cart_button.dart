import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:provider/src/provider.dart';

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
        return FloatingActionButton.small(
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (context.read<CartBloc>().state.cartList != null ||
              //     context.read<CartBloc>().state.cartList! != 0)
              Text(
                state.cartList?.length.toString() ?? '0',
                style: const TextStyle(fontSize: 10.0),
              ),
              const SizedBox(
                width: 2.0,
              ),
              const Icon(
                Icons.shopping_cart_rounded,
                size: 16.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
