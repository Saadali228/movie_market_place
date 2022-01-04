part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error }
enum AddToCartStatus { initial, loaded, error }
enum DeleteFromCartStatus { initial, loaded, error }
// enum EmptyCartStatus { initial, loaded, error }

class CartState {
  final CartStatus cartStatus;
  final List<CartRepoModel> cartList;
  final AddToCartStatus addToCartStatus;
  final DeleteFromCartStatus deleteFromCartStatus;
  final double subTotal;

  CartState({
    this.cartStatus = CartStatus.initial,
    this.cartList = const [],
    this.addToCartStatus = AddToCartStatus.initial,
    this.deleteFromCartStatus = DeleteFromCartStatus.initial,
    this.subTotal = 0,
  });

  CartState copyWith({
    CartStatus? cartStatus,
    List<CartRepoModel>? cartList,
    AddToCartStatus? addToCartStatus,
    DeleteFromCartStatus? deleteFromCartStatus,
    double? subTotal,
  }) {
    return CartState(
      cartList: cartList ?? this.cartList,
      cartStatus: cartStatus ?? this.cartStatus,
      addToCartStatus: addToCartStatus ?? this.addToCartStatus,
      deleteFromCartStatus: deleteFromCartStatus ?? this.deleteFromCartStatus,
      subTotal: subTotal ?? this.subTotal,
    );
  }

  List<Object> get props =>
      [cartStatus, cartList, addToCartStatus, deleteFromCartStatus, subTotal];
}
