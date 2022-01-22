import 'package:equatable/equatable.dart';

class AccountDataModel extends Equatable {
  final int id;
  final String? image;
  final String? title;
  final num? price;

  const AccountDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
    };
  }

  factory AccountDataModel.fromJson(Map<String, dynamic> map) => AccountDataModel(
        id: map['id'],
        title: map['title'],
        price: map['price'],
        image: map['image'],
      );

  @override
  List<Object?> get props => [id, title, price, image];
}
