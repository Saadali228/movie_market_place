import 'package:equatable/equatable.dart';

class CartDataModel extends Equatable {
  final int id;
  final String title;
  // int qty;
  final String image;
  final num price;
  // num totalPrice;

  CartDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    // required this.qty,
    // required this.totalPrice,
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
      'image': image,
      // "qty": qty,
      // "totalPrice": totalPrice,
    };
  }

  factory CartDataModel.fromJson(Map<String, dynamic> map) => CartDataModel(
        id: map['id'],
        title: map['title'],
        price: map['price'],
        image: map['image'],
        // qty: map['qty'],
        // totalPrice: map['totalPrice'],
      );

  @override
  List<Object?> get props => [];
}
