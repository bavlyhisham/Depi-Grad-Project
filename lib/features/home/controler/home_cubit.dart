// ignore_for_file: avoid_print

import 'package:depi/core/networks/remote/dio_helper.dart';
import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/home/controler/home_states.dart';
import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'package:depi/features/layout/controler/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Product> products = [];
  bool isSearchActive = false;
  String submittedQuery = '';

  List<Product> get searchedProducts {
    if (submittedQuery.isEmpty) {
      return [];
    }
    final query = submittedQuery.toLowerCase();
    return products
        .where((product) => product.title.toLowerCase().contains(query))
        .toList();
  }

  void activateSearch() {
    if (isSearchActive) {
      return;
    }
    isSearchActive = true;
    submittedQuery = '';
    emit(HomeSearchChangedState());
  }

  void submitSearch(String value) {
    isSearchActive = true;
    submittedQuery = value.trim();
    emit(HomeSearchChangedState());
  }

  void resetSearch() {
    if (!isSearchActive && submittedQuery.isEmpty) {
      return;
    }
    isSearchActive = false;
    submittedQuery = '';
    emit(HomeSearchChangedState());
  }

  bool handleBackFromSearch() {
    if (isSearchActive) {
      resetSearch();
      return false;
    }
    return true;
  }

  void getProductData() {
    print("getProductData called");

    emit(GetProductLoadingState());

    DioHelper.getData(url: '/api/v1/products')
        .then((value) {
          print("Status Code: ${value.statusCode}");
          print("Products Count: ${(value.data['data'] as List).length}");
          print(
            "First Image: ${(value.data['data'] as List).first['imageCover']}",
          );

          products = (value.data['data'] as List)
              .map((e) => Product.fromJson(e))
              .toList();

          emit(GetProductdatasuccessful());
        })
        .catchError((e) {
          print("GetProductDataError: $e");
          emit(GetProductError());
        });
  }

  void seeAllCategories(BuildContext context) {
    LayoutCubit.get(context).currentindex = 1;
    LayoutCubit.get(context).emit(BottomNavBarChangeState());
  }
}
