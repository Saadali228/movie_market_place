part of 'account_bloc.dart';

enum AccountStatus { initial, loading, loaded, error }
enum AddToWishListStatus { initial, loaded, error }
enum DeleteFromWishListStatus { initial, loaded, error }

class AccountState extends Equatable {
  const AccountState({
    this.accountStatus = AccountStatus.initial,
    this.wishList = const [],
    this.addToWishListStatus = AddToWishListStatus.initial,
    this.deleteFromWishListStatus = DeleteFromWishListStatus.initial,
  });

  final AccountStatus accountStatus;
  final List<AccountRepoModel> wishList;
  final AddToWishListStatus addToWishListStatus;
  final DeleteFromWishListStatus deleteFromWishListStatus;

  AccountState copyWith({
    AccountStatus? accountStatus,
    List<AccountRepoModel>? wishList,
    AddToWishListStatus? addToWishListStatus,
    DeleteFromWishListStatus? deleteFromWishListStatus,
  }) {
    return AccountState(
      accountStatus: accountStatus ?? this.accountStatus,
      wishList: wishList ?? this.wishList,
      addToWishListStatus: addToWishListStatus ?? this.addToWishListStatus,
      deleteFromWishListStatus:
          deleteFromWishListStatus ?? this.deleteFromWishListStatus,
    );
  }

  @override
  List<Object> get props => [
        accountStatus,
        wishList,
        addToWishListStatus,
        deleteFromWishListStatus,
      ];
}
