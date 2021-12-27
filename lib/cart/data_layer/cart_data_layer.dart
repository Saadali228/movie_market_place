import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/cart_data_model.dart';

class CartProvider {
  Future<void> addToCart(CartDataModel product) async {
    var newItem = CartDataModel(
      id: product.id,
      title: product.title,
      price: product.price,
      image: product.image,
      // qty: product.qty,
      // totalPrice: product.qty * product.price,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => CartDataModel.fromJson(e)).toList();
      //  cartList.removeWhere((ae)=> ae.id == product.id);
      bool incrementProduct =
          cartList.any((element) => element.id == newItem.id);
      if (incrementProduct) {
        incrementCartProduct(newItem);
      } else {
        cartList.add(newItem);
      }
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    } else {
      List<CartDataModel> cartList = [];
      cartList.add(newItem);
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }

  Future<List<CartDataModel>> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    print(userPref);
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => CartDataModel.fromJson(e)).toList();
    return list;
  }

  Future<void> deleteProductFromCart(CartDataModel product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map
          .map(
            (e) => CartDataModel.fromJson(e),
          )
          .toList();
      cartList.removeWhere((ae) => ae.id == product.id);
      final carJson = cartList
          .map(
            (e) => e.toJson(),
          )
          .toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
    // else {
    //   List<Product> cartList = [];
    //   cartList.remove(product);
    //   final carJson = cartList.map((e) => e.toJson()).toList();
    //   var encodedList = json.encode(carJson);
    //   await prefs.setString('cartList', encodedList);
    // }
  }

  Future<void> emptyCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map
          .map(
            (e) => CartDataModel.fromJson(e),
          )
          .toList();
      cartList.clear();
      final carJson = cartList
          .map(
            (e) => e.toJson(),
          )
          .toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }

  Future<void> incrementCartProduct(CartDataModel newItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map
          .map(
            (e) => CartDataModel.fromJson(e),
          )
          .toList();
      // int index = cartList.indexOf(product);
      final index = cartList.indexWhere((element) => element.id == newItem.id);
      // cartList[index].qty++;
      // cartList[index].totalPrice = cartList[index].qty * cartList[index].price;
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }

  Future<void> decrementCartProduct(CartDataModel product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map
          .map(
            (e) => CartDataModel.fromJson(e),
          )
          .toList();
      final index = cartList.indexWhere((element) => element.id == product.id);
      // cartList[index].qty--;
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }
}
