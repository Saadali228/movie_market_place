import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_market_place/account/repository_layer/account_repo_layer.dart';
import 'package:movie_market_place/account/repository_layer/models/account_repo_model.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountRepoLayer accountRepoLayer;
  AccountBloc(this.accountRepoLayer) : super(const AccountState()) {
    on<WishListFetched>((event, emit) async {
      emit(
        state.copyWith(accountStatus: AccountStatus.loading),
      );
      try {
        if (state.wishList.isEmpty) {
          final _wishList = await accountRepoLayer.getWishListProducts();
          emit(
            state.copyWith(
              wishList: _wishList,
              accountStatus: AccountStatus.loaded,
            ),
          );
        } else {
          emit(
            state.copyWith(accountStatus: AccountStatus.loaded),
          );
        }
      } catch (_) {
        emit(state.copyWith(accountStatus: AccountStatus.error));
      }
    });

    on<WishAdded>((event, emit) async {
      try {
        await accountRepoLayer.addToWishList(event.wish);
        if (state.wishList.isEmpty) {
          List<AccountRepoModel> newWishList = [];
          newWishList.add(event.wish);
          emit(
            state.copyWith(
              wishList: newWishList,
              addToWishListStatus: AddToWishListStatus.loaded,
            ),
          );
        } else if (state.wishList
            .any((element) => element.id == event.wish.id)) {
          final newWishList = state.wishList;
          emit(
            state.copyWith(
                wishList: newWishList,
                addToWishListStatus: AddToWishListStatus.error),
          );
        } else {
          List<AccountRepoModel> newWishList = [];
          state.wishList.map((e) => newWishList.add(e)).toList();
          newWishList.add(event.wish);
          emit(
            state.copyWith(
              wishList: newWishList,
              addToWishListStatus: AddToWishListStatus.loaded,
            ),
          );
        }
      } catch (_) {
        emit(state.copyWith(addToWishListStatus: AddToWishListStatus.error));
      }
    });

    on<WishDeleted>((event, emit) async {
      try {
        await accountRepoLayer.deleteProductFromWishList(event.wish);
        final newWishList = state.wishList;
        newWishList.removeWhere((e) => e.id == event.wish.id);
        emit(
          state.copyWith(
            wishList: newWishList,
            deleteFromWishListStatus: DeleteFromWishListStatus.loaded,
          ),
        );
      } catch (_) {
        emit(
          state.copyWith(
            deleteFromWishListStatus: DeleteFromWishListStatus.error,
          ),
        );
      }
    });

    on<SetDeleteWishToInitial>((event, emit) {
      emit(state.copyWith(
        deleteFromWishListStatus: DeleteFromWishListStatus.initial,
      ));
    });
  }
}
