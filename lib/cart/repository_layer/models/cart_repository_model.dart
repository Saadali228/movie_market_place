import 'package:equatable/equatable.dart';

class CartRepoModel extends Equatable {
  final int id;
  final String title;
  // int qty;
  final num price;
  final String? image;
  // num totalPrice;

  const CartRepoModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    // required this.qty,
    // required this.totalPrice,
  });
  // CartRepoModel copyWith({
  //   num subTotal,
  // }) {
  //   return CartRepoModel();
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

  factory CartRepoModel.fromJson(Map<String, dynamic> map) => CartRepoModel(
        id: map['id'],
        title: map['title'],
        price: map['price'],
        image: map['image'],
        // qty: map['qty'],
        // totalPrice: map['totalPrice'],
      );

  @override
  List<Object?> get props => [id, title, price, image];
}
