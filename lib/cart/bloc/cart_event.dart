part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DisplayProducts extends CartEvent {
  @override
  List<Object?> get props => [];
}

class AddProduct extends CartEvent {
  final CartRepoModel product;
  AddProduct(this.product);
  @override
  List<Object?> get props => [];
}

class DeleteProduct extends CartEvent {
  final CartRepoModel product;
  DeleteProduct(this.product);
  @override
  List<Object?> get props => [];
}

class AddCartInitial extends CartEvent {
  @override
  List<Object?> get props => [];
}

class DeleteCartInitial extends CartEvent {
  @override
  List<Object?> get props => [];
}

class SubTotal extends CartEvent {
  final CartRepoModel product;

  SubTotal(this.product);
  @override
  List<Object?> get props => [];
}

class EmptyCart extends CartEvent {
  @override
  List<Object?> get props => [];
}
class UpdateCartCount extends CartEvent {
  @override
  List<Object?> get props => [];
}
