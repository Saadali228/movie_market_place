import 'dart:convert';

import 'package:movie_market_place/account/data_layer/models/account_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDataLayer{

  Future<List<AccountDataModel>> getWishListProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('wishList');
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => AccountDataModel.fromJson(e)).toList();
    return list;
  }

   Future<void> addToWishList(AccountDataModel wish) async {
    var newItem = AccountDataModel(
      id: wish.id,
      title: wish.title,
      price: wish.price,
      image: wish.image,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('wishList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final wishList = map.map((e) => AccountDataModel.fromJson(e)).toList();
      bool incrementProduct =
          wishList.any((element) => element.id == newItem.id);
      if (incrementProduct) {
        incrementWishListProduct(newItem);
      } else {
        wishList.add(newItem);
      }
      final wishJson = wishList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(wishJson);
      await prefs.setString('wishList', encodedList);
    } else {
      List<AccountDataModel> wishList = [];
      wishList.add(newItem);
      final wishJson = wishList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(wishJson);
      await prefs.setString('wishList', encodedList);
    }
  }

  Future<void> incrementWishListProduct(AccountDataModel newItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('wishList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final wishList = map
          .map(
            (e) => AccountDataModel.fromJson(e),
          )
          .toList();
      final wishJson = wishList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(wishJson);
      await prefs.setString('wishList', encodedList);
    }
  }

  Future<void> deleteProductFromWishList(AccountDataModel product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('wishList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final wishList = map
          .map(
            (e) => AccountDataModel.fromJson(e),
          )
          .toList();
      wishList.removeWhere((ae) => ae.id == product.id);
      final wishJson = wishList
          .map(
            (e) => e.toJson(),
          )
          .toList();
      var encodedList = json.encode(wishJson);
      await prefs.setString('wishList', encodedList);
    }
  }
}