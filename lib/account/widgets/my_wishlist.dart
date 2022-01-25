import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/account/bloc/account_bloc.dart';
import 'package:movie_market_place/account/repository_layer/models/account_repo_model.dart';
import 'package:movie_market_place/account/widgets/wishlist_grid.dart';

class MyWishlist extends StatelessWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'My Wishlist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30.0),
        BlocBuilder<AccountBloc, AccountState>(
          buildWhen: (previous, current) =>
              previous.accountStatus != current.accountStatus ||
              previous.deleteFromWishListStatus !=
                  current.deleteFromWishListStatus,
          builder: (context, state) {
            if (state.deleteFromWishListStatus ==
                DeleteFromWishListStatus.loaded) {
              context.read<AccountBloc>().add(SetDeleteWishToInitial());
            }
            switch (state.accountStatus) {
              case AccountStatus.initial:
                context.read<AccountBloc>().add(
                      WishListFetched(),
                    );
                return const _WishListInitial();
              case AccountStatus.loading:
                return const _WishListLoading();
              case AccountStatus.loaded:
                return _WishListLoaded(wishList: state.wishList);
              case AccountStatus.error:
              default:
                return const _WishListError();
            }
          },
        ),
      ],
    );
  }
}

class _WishListInitial extends StatelessWidget {
  const _WishListInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'WishList is Empty!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _WishListLoading extends StatelessWidget {
  const _WishListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _WishListLoaded extends StatefulWidget {
  final List<AccountRepoModel> wishList;
  const _WishListLoaded({Key? key, required this.wishList}) : super(key: key);

  @override
  State<_WishListLoaded> createState() => _WishListLoadedState();
}

class _WishListLoadedState extends State<_WishListLoaded> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.wishList.isEmpty
          ? const Center(
              child: Text(
                'WishList is Empty!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.builder(
              // key: _listKey,
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              itemCount: widget.wishList.length,
              itemBuilder: (context, index) {
                return WishlistGrid(
                  item: widget.wishList[index],
                  // animation: animation,
                  onDelete: () {
                    // print(index);
                    context.read<AccountBloc>().add(
                          WishDeleted(widget.wishList[index]),
                        );
                  },
                );
              },
            ),
    );
  }

  // void removeItem(int index) {
  //   context.read<AccountBloc>().add(
  //         WishDeleted(widget.wishList[index]),
  //       );
  //   final removedItem = widget.wishList[index];
  //   _listKey.currentState!.removeItem(
  //     index,
  //     (context, animation) => WishlistGrid(
  //       item: removedItem,
  //       animation: animation,
  //       onDelete: () {},
  //     ),
  //   );
  // }
}

class _WishListError extends StatelessWidget {
  const _WishListError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Something went wrong!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
