part of 'account_bloc.dart';

 class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
 }

  class WishListFetched extends AccountEvent {
  @override
  List<Object> get props => [];
}

class WishListButtonUpdated extends AccountEvent {
  @override
  List<Object> get props => [];
}

class WishAdded extends AccountEvent {
  const WishAdded(this.wish);
  final AccountRepoModel wish;

  @override
  List<Object> get props => [wish];
}

class WishDeleted extends AccountEvent {
  const WishDeleted(this.wish);
  final AccountRepoModel wish;

  @override
  List<Object> get props => [wish];
}
