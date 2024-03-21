import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/chat/view/views/widgets/chat_body.dart';
import 'package:book_extchange/features/fav_ads/view/views/widgets/fav_ads_body.dart';
import 'package:book_extchange/features/home/view/views/widgets/home_body.dart';
import 'package:book_extchange/features/my_ads/view/views/widgets/my_ads_body.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

  List<Widget> bottomNavBodies = [
    HomeBody(),
    ChatBody(),
    MyAdsBody(),
    FavAdsBody()
  ];

  void onTapChange(int newIndex){
    selectedIndex = newIndex;
    emit(BottomNavChanged());
    print(selectedIndex);
  }
}