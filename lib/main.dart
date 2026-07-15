// ignore_for_file: prefer_const_constructors_in_immutables, unused_import

import 'dart:developer';

import 'package:depi/core/blocObserver/blocObsever.dart';
import 'package:depi/core/cash/cache_helper.dart';
import 'package:depi/core/networks/remote/api_service.dart';
import 'package:depi/core/networks/remote/dio_helper.dart';

import 'package:depi/features/auth/manager/auth_cubit.dart';
import 'package:depi/features/auth/presentation/views/sign_in_view.dart';
import 'package:depi/features/cart/views/cartScreen.dart';

import 'package:depi/features/home/controler/home_cubit.dart';
import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'package:depi/features/layout/views/shop_layout.dart';
import 'package:depi/features/cart/controller/cart_cubit.dart';
import 'package:depi/features/product_detials/views/product_details_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  DioHelper.init();

  bool isLoggedIn = CacheHelper.getData(key: 'isLoggedIn') ?? false;

  runApp(Main(isLoggedIn: isLoggedIn));
}

class Main extends StatelessWidget {
  final bool isLoggedIn;

  const Main({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => HomeCubit()..getProductData()),
        BlocProvider(create: (context) => AuthCubit(ApiService(Dio()))),
        BlocProvider(
          create: (context) => CartCubit()..getCart(showLoading: false),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(412, 924),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: isLoggedIn ? const Shoplayout() : const SignInView(),
          );
        },
      ),
    );
  }
}
