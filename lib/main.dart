import 'package:depi/core/networks/remote/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Imports الخاصة بمشروع التيم
import 'package:depi/core/blocObserver/blocObsever.dart';
import 'package:depi/core/networks/remote/dio_helper.dart';
import 'package:depi/core/cash/cache_helper.dart';
import 'package:depi/features/auth/manager/auth_cubit.dart';
import 'package:depi/features/auth/presentation/views/sign_in_view.dart';
import 'package:depi/features/home/controler/home_cubit.dart';
import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'features/layout/views/shop_layout.dart';

// Imports الخاصة بالـ Onboarding
import 'package:depi/features/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  DioHelper.init();

  // التشيك الخاص بالـ Onboarding
  bool showOnboarding = CacheHelper.getData(key: 'showOnboarding') ?? true;
  bool isLoggedIn = CacheHelper.getData(key: 'isLoggedIn') ?? false;

  runApp(Main(isLoggedIn: isLoggedIn, showOnboarding: showOnboarding));
}

class Main extends StatelessWidget {
  final bool isLoggedIn;
  final bool showOnboarding;

  const Main({
    super.key,
    required this.isLoggedIn,
    required this.showOnboarding,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => HomeCubit()..getProductData()),
        BlocProvider(create: (context) => AuthCubit(ApiService(Dio()))),
      ],
      child: ScreenUtilInit(
        designSize: const Size(412, 924),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            home: true   //showOnboarding
                ? OnboardingScreen()
                : (isLoggedIn ? const Shoplayout() : const SignInView()),
          );
        },
      ),
    );
  }
}
