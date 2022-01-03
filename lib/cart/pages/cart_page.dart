import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/checkout/pages/check_out.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';
import 'package:movie_market_place/cart/widgets/cart_item.dart';
import 'package:movie_market_place/home_page/widgets/dialog_box.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
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
    return Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Loading!',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
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

class _CartLoaded extends StatefulWidget {
  const _CartLoaded({Key? key, required this.cartList}) : super(key: key);
  final List<CartRepoModel> cartList;

  @override
  State<_CartLoaded> createState() => _CartLoadedState();
}

class _CartLoadedState extends State<_CartLoaded> {
  final listKey = GlobalKey<AnimatedListState>();

  num subTotal() {
    num ans = 0;
    for (var element in widget.cartList) {
      ans += element.price;
    }
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cartList.isEmpty) {
      return const Center(
        child: Text(
          'Cart is Empty!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      );
    }
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.deleteFromCartStatus != current.deleteFromCartStatus,
      listener: (context, state) {
        // if (state.deleteFromCartStatus == DeleteFromCartStatus.loaded) {
        //   showDialog(
        //     context: context,
        //     builder: (_) => const DialogBox(
        //       title: 'Movie Removed from Cart',
        //       icon: Icons.remove_circle_outline,
        //       iconColor: Colors.red,
        //     ),
        //   );
        //   context.read<CartBloc>().add(DeleteCartInitial());
        // }
        if (state.deleteFromCartStatus == DeleteFromCartStatus.error) {
          showDialog(
            context: context,
            builder: (_) => const DialogBox(
              title: 'Movie Not Removed from Cart',
              icon: Icons.remove_circle_outline,
              iconColor: Colors.red,
            ),
          );
          context.read<CartBloc>().add(DeleteCartInitial());
        }
      },
      child: Column(
        children: [
          Expanded(
            child: AnimatedList(
              // itemExtent: 100,
              key: listKey,
              scrollDirection: Axis.vertical,
              initialItemCount: widget.cartList.length,
              itemBuilder: (context, index, animation) {
                return CartItem(
                  item: widget.cartList[index],
                  animation: animation,
                  onDelete: () => removeItem(index),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${subTotal().toString()}",
                style: const TextStyle(
                  color: Colors.white,
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
              ),
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.purple,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Checkout',
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

  void removeItem(int index) {
    context.read<CartBloc>().add(
          DeleteProduct(widget.cartList[index]),
        );
    final removedItem = widget.cartList[index];
    listKey.currentState!.removeItem(
      index,
      (context, animation) => CartItem(
        item: removedItem,
        animation: animation,
        onDelete: () {},
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
