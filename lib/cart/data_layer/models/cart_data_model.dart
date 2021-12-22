import 'package:equatable/equatable.dart';

class CartDataModel extends Equatable {
  final int id;
  final String title;
  int qty;
  final num price;
  num totalPrice;

  CartDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
    required this.totalPrice,
  });
  // CartDataModel copyWith({
  //   num subTotal,
  // }) {
  //   return CartDataModel();
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      "qty": qty,
      "totalPrice": totalPrice,
    };
  }

  factory CartDataModel.fromJson(Map<String, dynamic> map) => CartDataModel(
        id: map['id'],
        title: map['title'],
        price: map['price'],
        qty: map['qty'],
        totalPrice: map['totalPrice'],
      );

  @override
  List<Object?> get props => [];
}
