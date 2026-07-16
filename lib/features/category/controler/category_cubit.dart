import 'dart:developer';

import 'package:depi/core/networks/remote/dio_helper.dart';
import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/category/controler/category_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());
  static CategoryCubit get(context) => BlocProvider.of(context);
  List<Category> categories = [];
  List<Product> productOFcategory = [];
  

  void getCategorData() {
    emit(GetCategoryLoadingState());
    DioHelper.getData(url: '/api/v1/categories/')
        .then((value) {
          categories = (value.data['data'] as List)
              .map((e) => Category.fromJson(e))
              .toList();
          emit(GetCategorydatasuccessful());
        })
        .catchError((e) {
          log('GetCategorydataError $e');
          emit(GetCategoryError());
        });
  }

  void getProductOfCategory(String categoryName,List<Product>products) {
    productOFcategory = [];
    emit(ProductofcategoryLoadingState());
    productOFcategory = products
        .where((product) => product.category.name == categoryName)
        .toList();
    emit(GetProductofcategorydatasuccessful());
  }
}
