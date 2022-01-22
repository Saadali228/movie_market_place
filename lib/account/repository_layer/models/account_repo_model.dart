import 'package:equatable/equatable.dart';

class AccountRepoModel extends Equatable {
  final int id;
  final String? image;
  final String? title;
  final num? price;

  const AccountRepoModel({
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

  factory AccountRepoModel.fromJson(Map<String, dynamic> map) => AccountRepoModel(
        id: map['id'],
        title: map['title'],
        price: map['price'],
        image: map['image'],
      );

  @override
  List<Object?> get props => [id, title, price, image];
}
