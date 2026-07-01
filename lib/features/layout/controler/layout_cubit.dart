import 'package:depi/features/category/views/category_screen.dart';
import 'package:depi/features/home/views/home_screen.dart';
import 'package:depi/features/layout/controler/layout_states.dart';
import 'package:depi/features/setting/views/setting_screen.dart';
import 'package:depi/features/wishlist/views/wish_list_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LayoutCubit extends Cubit <LayoutStates>{
  LayoutCubit():super(LayoutIntitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> bottomscreens = [
    Homescreen(),
    CategoryScreen(),
    WishListScreen(),
    SettingScreen()
  ];
  void changebottomstate(int index) {
    currentindex = index;
    
    emit(BottomNavBarChangeState());
  }

}