import 'package:movie_market_place/cart/data_layer/cart_data_layer.dart';
import 'package:movie_market_place/cart/data_layer/models/cart_data_model.dart';

import 'models/cart_repository_model.dart';

class CartRepository {
  final CartProvider _dataProvider;

  CartRepository(this._dataProvider);
  Future<void> addToCart(CartRepoModel product) async {
    await _dataProvider.addToCart(
      CartDataModel(
        id: product.id,
        title: product.title,
        price: product.price,
        // qty: product.qty,
        // totalPrice: product.totalPrice,
      ),
    );
  }

  Future<List<CartRepoModel>> getCartProducts() async {
    final list = await _dataProvider.getCartProducts();
    return list
        .map(
          (e) => CartRepoModel(
            id: e.id,
            title: e.title,
            price: e.price,
            // qty: e.qty,
            // totalPrice: e.totalPrice,
          ),
        )
        .toList();
  }

  Future<void> deleteProductFromCart(CartRepoModel product) async {
    await _dataProvider.deleteProductFromCart(
      CartDataModel(
        id: product.id,
        title: product.title,
        price: product.price,
        // qty: product.qty,
        // totalPrice: product.totalPrice,
      ),
    );
  }

  Future<void> emptyCart() async {
    await _dataProvider.emptyCart();
  }

  Future<void> incrementCartProduct(CartRepoModel product) async {
    await _dataProvider.incrementCartProduct(
      CartDataModel(
        id: product.id,
        title: product.title,
        price: product.price,
        // qty: product.qty,
        // totalPrice: product.totalPrice,
      ),
    );
  }

  Future<void> decrementCartProduct(CartRepoModel product) async {
    await _dataProvider.decrementCartProduct(
      CartDataModel(
        id: product.id,
        title: product.title,
        price: product.price,
        // qty: product.qty,
        // totalPrice: product.totalPrice,
      ),
    );
  }
}
