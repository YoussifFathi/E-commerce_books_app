import 'package:bookly/bloc_observe.dart';
import 'package:bookly/core/routing/locator_service.dart';
import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/utils/measures.dart';
import 'package:bookly/core/utils/theme.dart';
import 'package:bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:bookly/features/chat/data/repos/chat_repo.dart';
import 'package:bookly/features/chat/view/view_models/chat_cubit.dart';
import 'package:bookly/features/fav_ads/data/repos/fav_ads_repo.dart';
import 'package:bookly/features/fav_ads/view/view_models/fav_ads_cubit.dart';
import 'package:bookly/features/my_ads/data/repos/my_ads_repo/my_ads_repo.dart';
import 'package:bookly/features/my_ads/view/view_models/my_ads_cubit.dart';
import 'package:bookly/features/splash/view/view_models/splash_cubit/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.sizeOf(context).width;
    deviceHeight = MediaQuery.sizeOf(context).height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(getIt.get<Dio>())),
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(
          create: (context) =>
          FavAdsCubit(getIt.get<FavAdsRepo>()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ChatCubit(getIt.get<ChatRepo>()),
        ),
        BlocProvider(
          create: (context) => MyAdsCubit(getIt.get<MyAdsRepo>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.router,
        title: 'Flutter Demo',
        theme: theme,
      ),
    );
  }
}
