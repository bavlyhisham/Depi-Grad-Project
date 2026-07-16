import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cash/cache_helper.dart';
import '../../../core/networks/remote/dio_helper.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  Map<String, bool> loadingProducts = {};
  // Cart Data
  Map<String, dynamic>? cartData;

  int get cartCount => cartData?['numOfCartItems'] ?? 0;

  double get totalPrice =>
      (cartData?['data']?['totalCartPrice'] as num?)?.toDouble() ?? 0.0;

  List get products => cartData?['data']?['products'] ?? [];

  // Add Product To Cart
Future<void> addToCart(String productId, int count, int stock) async {
  if (count > stock) {
    emit(CartErrorState("You can't add more than available stock"));
    return;
  }

  loadingProducts[productId] = true;
  emit(CartLoadingState());

  try {
    String token = CacheHelper.getData(key: 'token');

    DioHelper.setToken(token);

    await DioHelper.postData(
      url: '/api/v1/cart',
      data: {
        "productId": productId,
      },
    );

    await DioHelper.putData(
      url: '/api/v1/cart/$productId',
      data: {
        "count": count,
      },
    );

    await getCart(showLoading: false);
  } on DioException catch (e) {
    emit(
      CartErrorState(
        e.response?.data['message'] ?? 'Something went wrong',
      ),
    );
  } catch (e) {
    emit(CartErrorState(e.toString()));
  } finally {
    loadingProducts[productId] = false;
    emit(CartLoadedState(cartData ?? {}));
  }
}

  // Get Cart
  Future<void> getCart({bool showLoading = true}) async {
    if (showLoading) {
      emit(CartLoadingState());
    }

    try {
      String token = CacheHelper.getData(key: 'token');

      DioHelper.setToken(token);

      final response = await DioHelper.getData(url: '/api/v1/cart');

      cartData = response.data;

      emit(CartLoadedState(cartData!));
    } on DioException catch (e) {
      emit(
        CartErrorState(e.response?.data['message'] ?? 'Something went wrong'),
      );
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  // Remove Product From Cart
  Future<void> removeFromCart(String productId) async {
    try {
      String token = CacheHelper.getData(key: 'token');

      DioHelper.setToken(token);

      await DioHelper.deleteData(url: '/api/v1/cart/$productId');

      await getCart(showLoading: false);
    } on DioException catch (e) {
      emit(
        CartErrorState(e.response?.data['message'] ?? 'Something went wrong'),
      );
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  // Update Product Quantity
  Future<void> updateCartQuantity(
    String productId,
    int count,
    int stock,
  ) async {
    if (count > stock) {
      emit(CartErrorState("You can't add more than available stock"));
      return;
    }

    if (count < 1) return;

    try {
      String token = CacheHelper.getData(key: 'token');

      DioHelper.setToken(token);

      await DioHelper.putData(
        url: '/api/v1/cart/$productId',
        data: {"count": count},
      );

      await getCart(showLoading: false);
    } on DioException catch (e) {
      emit(
        CartErrorState(e.response?.data['message'] ?? 'Something went wrong'),
      );
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  Future<void> clearCart() async {
    try {
      String token = CacheHelper.getData(key: 'token');

      DioHelper.setToken(token);

      await DioHelper.deleteData(url: '/api/v1/cart');

      await getCart(showLoading: false);
    } on DioException catch (e) {
      emit(
        CartErrorState(e.response?.data['message'] ?? 'Something went wrong'),
      );
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }
}
