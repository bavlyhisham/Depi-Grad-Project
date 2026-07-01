import 'dart:developer';
import 'package:depi/core/blocObserver/blocObsever.dart';
import 'package:depi/core/networks/remote/dio_helper.dart';
import 'package:depi/features/home/controler/home_cubit.dart';
import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'package:depi/features/layout/views/shop_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  

  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
      BlocProvider(create: (context) => HomeCubit()..getProductData()),

      
      ],
      child: ScreenUtilInit(
        designSize: Size(412, 924),
        minTextAdapt: true,
        child: MaterialApp(
      
          debugShowCheckedModeBanner: false,
          home: Shoplayout(),
        ),
      ),
    );
  }
}
