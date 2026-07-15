import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cash/cache_helper.dart';
import '../../../core/networks/remote/dio_helper.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  Future<void> addToCart(String productId) async {
    print("Add To Cart Pressed");
    emit(CartLoadingState());

    try {
      String token = CacheHelper.getData(key: 'token');

      DioHelper.setToken(token);

      await DioHelper.postData(
        url: '/api/v1/cart',
        data: {"productId": productId},
      );

      emit(CartSuccessState());
    } on DioException catch (e) {
      emit(
        CartErrorState(e.response?.data['message'] ?? 'Something went wrong'),
      );
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  Future<void> getCart() async {
    emit(CartLoadingState());

    try {
      String token = CacheHelper.getData(key: 'token');

      DioHelper.setToken(token);

      final response = await DioHelper.getData(url: '/api/v1/cart');

      print(response.data);

      emit(CartLoadedState(response.data));
    } on DioException catch (e) {
      emit(
        CartErrorState(e.response?.data['message'] ?? 'Something went wrong'),
      );
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }
}
