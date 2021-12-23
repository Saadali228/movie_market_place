import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/pages/check_out.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/cart/widgets/cart_item.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            switch (state.cartStatus) {
              case CartStatus.initial:
                context.read<CartBloc>().add(
                      DisplayProducts(),
                    );
                return const _CartInitial();
              case CartStatus.loading:
                return const _CartLoading();
              case CartStatus.loaded:
                return _CartLoaded(
                  cartList: state.cartList,
                );
              case CartStatus.error:
              default:
                return const _CartError();
            }
          },
        ),
      ),
    );
  }
}

class _CartInitial extends StatelessWidget {
  const _CartInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Cart is Empty!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}

class _CartLoading extends StatelessWidget {
  const _CartLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}

class _CartLoaded extends StatelessWidget {
  const _CartLoaded({Key? key, required this.cartList}) : super(key: key);
  final List<CartRepoModel> cartList;
  num subTotal() {
    num ans = 0;
    cartList.forEach(
      (element) {
        ans += element.price;
      },
    );
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    if (cartList.isEmpty) {
      return const Text('Cart is Empty!', style: TextStyle(fontSize: 64));
    }
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.deleteFromCartStatus != current.deleteFromCartStatus,
      listener: (context, state) {
        if (state.deleteFromCartStatus == DeleteFromCartStatus.loaded) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Removed'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(DeleteCartInitial());
        }
        if (state.deleteFromCartStatus == DeleteFromCartStatus.error) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Not Removed'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(DeleteCartInitial());
        }
      },
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return CartItem(
                  item: cartList[index],
                  onDelete: () => context.read<CartBloc>().add(
                        DeleteProduct(cartList[index]),
                      ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Ammount:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${subTotal().toString()}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              // left: 200.0,
              top: 30,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueAccent,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    5.0,
                  ),
                ),
                color: Colors.green,
              ),
              width: MediaQuery.of(context).size.width * 0.18,
              height: MediaQuery.of(context).size.height * 0.08,
              child: TextButton(
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Check Out',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    CheckOutScreen.checkOutPageRoute,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartError extends StatelessWidget {
  const _CartError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Something went wrong!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}
