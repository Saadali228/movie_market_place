import 'package:movie_market_place/account/data_layer/account_data_layer.dart';
import 'package:movie_market_place/account/data_layer/models/account_data_model.dart';
import 'package:movie_market_place/account/repository_layer/models/account_repo_model.dart';

class AccountRepoLayer {
  AccountRepoLayer(this._accountDataLayer);

  final AccountDataLayer _accountDataLayer;

  Future<void> addToWishList(AccountRepoModel wish) async {
    await _accountDataLayer.addToWishList(
      AccountDataModel(
        id: wish.id,
        title: wish.title,
        price: wish.price,
        image: wish.image,
      ),
    );
  }

  Future<List<AccountRepoModel>> getWishListProducts() async {
    final list = await _accountDataLayer.getWishListProducts();
    return list
        .map(
          (e) => AccountRepoModel(
            id: e.id,
            title: e.title,
            price: e.price,
            image: e.image,
            // qty: e.qty,
            // totalPrice: e.totalPrice,
          ),
        )
        .toList();
  }

  Future<void> deleteProductFromWishList(AccountRepoModel wish) async {
    await _accountDataLayer.deleteProductFromWishList(
      AccountDataModel(
        id: wish.id,
        title: wish.title,
        price: wish.price,
        image: wish.image,
        // qty: product.qty,
        // totalPrice: product.totalPrice,
      ),
    );
  }

    Future<void> incrementWishListProduct(AccountRepoModel wish) async {
    await _accountDataLayer.incrementWishListProduct(
      AccountDataModel(
        id: wish.id,
        title: wish.title,
        price: wish.price,
        image: wish.image,
      ),
    );
  }
}