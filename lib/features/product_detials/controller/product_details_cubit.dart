// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:depi/core/networks/remote/product_model.dart';
import 'product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit(this.product) : super(ProductDetailsInitialState()) {
    _startOfferTimer();
  }

  final Product product;

  bool isFavorite = false;

  int hours = 1;
  int minutes = 0;
  int seconds = 59;

  bool isOfferExpired = false;

  Timer? _timer;

  bool get hasDiscount =>
      !isOfferExpired &&
      product.priceAfterDiscount > 0 &&
      product.priceAfterDiscount < product.price;

  double get currentPrice =>
      hasDiscount ? product.priceAfterDiscount.toDouble() : product.price;

  int get discountPercentage {
    if (!hasDiscount) return 0;
    return (((product.price - product.priceAfterDiscount) / product.price) *
            100)
        .round();
  }

  String formatPrice(num price) {
    return 'EGP ${price.toStringAsFixed(0)}';
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    emit(ProductDetailsFavoriteChangedState());
  }

  void _startOfferTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (hours == 0 && minutes == 0 && seconds == 0) {
        isOfferExpired = true;
        _timer?.cancel();
        emit(ProductDetailsOfferExpiredState());
        return;
      }

      if (seconds > 0) {
        seconds--;
      } else {
        if (minutes > 0) {
          minutes--;
          seconds = 59;
        } else {
          if (hours > 0) {
            hours--;
            minutes = 59;
            seconds = 59;
          }
        }
      }

      emit(ProductDetailsTimerTickState());
    });
  }

  String get formattedHours => hours.toString().padLeft(2, '0');
  String get formattedMinutes => minutes.toString().padLeft(2, '0');
  String get formattedSeconds => seconds.toString().padLeft(2, '0');

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
