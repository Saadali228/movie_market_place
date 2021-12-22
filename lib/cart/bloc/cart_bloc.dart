import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_market_place/cart/repository_layer/cart_repository.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartState()) {
    on<DisplayProducts>((event, emit) async {
      emit(
        state.copyWith(cartStatus: CartStatus.loading),
      );
      try {
        final _cartList = await cartRepository.getCartProducts();
        emit(
          state.copyWith(cartList: _cartList, cartStatus: CartStatus.loaded),
        );
      } catch (_) {
        emit(state.copyWith(cartStatus: CartStatus.error));
      }
    });

    on<AddProduct>((event, emit) async {
      try {
        await cartRepository.addToCart(event.product);
        if (state.cartList.any((element) => element.id == event.product.id)) {
          final newCartList = state.cartList;
          int index = newCartList.indexWhere((e) => event.product.id == e.id);
          newCartList[index].qty++;
          newCartList[index].totalPrice =
              newCartList[index].qty * newCartList[index].price;
          emit(
            state.copyWith(
                cartList: newCartList, addToCartStatus: AddToCartStatus.loaded),
          );
        } else {
          List<CartRepoModel> newCartList = [];
          state.cartList.map((e) => newCartList.add(e)).toList();
          newCartList.add(event.product);
          emit(
            state.copyWith(
                cartList: newCartList, addToCartStatus: AddToCartStatus.loaded),
          );
        }
      } catch (_) {
        emit(state.copyWith(addToCartStatus: AddToCartStatus.error));
      }
    });

    on<IncrementQuantity>((event, emit) async {
      try {
        await cartRepository.incrementCartProduct(event.product);
        final newCartList = state.cartList;
        int index = newCartList.indexOf(event.product);
        newCartList[index] = event.product;
        emit(
          state.copyWith(cartList: newCartList, cartStatus: CartStatus.loaded),
        );
      } catch (_) {
        emit(state.copyWith(cartStatus: CartStatus.error));
      }
    });

    on<DecrementQuantity>((event, emit) async {
      try {
        await cartRepository.decrementCartProduct(event.product);
        final newCartList = state.cartList;
        int index = newCartList.indexOf(event.product);
        newCartList[index] = event.product;
        emit(
          state.copyWith(cartList: newCartList, cartStatus: CartStatus.loaded),
        );
      } catch (_) {
        emit(state.copyWith(cartStatus: CartStatus.error));
      }
    });

    on<DeleteProduct>((event, emit) async {
      try {
        await cartRepository.deleteProductFromCart(event.product);
        final newCartList = state.cartList;
        newCartList.remove(event.product);
        emit(
          state.copyWith(
              cartList: newCartList,
              deleteFromCartStatus: DeleteFromCartStatus.loaded),
        );
      } catch (_) {
        emit(
          state.copyWith(deleteFromCartStatus: DeleteFromCartStatus.error),
        );
      }
    });

    on<AddCartInitial>((event, emit) async {
      emit(
        state.copyWith(addToCartStatus: AddToCartStatus.initial),
      );
    });

    on<DeleteCartInitial>((event, emit) async {
      emit(
        state.copyWith(deleteFromCartStatus: DeleteFromCartStatus.initial),
      );
    });
  }
}
