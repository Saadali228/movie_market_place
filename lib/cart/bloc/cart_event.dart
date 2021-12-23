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

class IncrementQuantity extends CartEvent {
  final CartRepoModel product;
  final bool isAdd;
  IncrementQuantity({required this.product, this.isAdd = true});
  @override
  List<Object?> get props => [];
}

class DecrementQuantity extends CartEvent {
  final CartRepoModel product;
  final bool isAdd;
  DecrementQuantity({required this.product, this.isAdd = false});
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
