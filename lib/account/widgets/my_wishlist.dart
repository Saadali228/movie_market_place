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
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
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

class _WishListLoaded extends StatelessWidget {
  final List<AccountRepoModel> wishList;
  const _WishListLoaded({Key? key, required this.wishList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: wishList.length,
      itemBuilder: (context, index) {
        return WishlistGrid(item: wishList[index]);
      },
    );
  }
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
