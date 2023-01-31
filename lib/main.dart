import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/business_logic/search_cubit/search_cubit.dart';
import 'business_logic/favorite_cubit/favorite_cubit.dart';
import 'business_logic/home_cubit/home_page_cubit.dart';
import 'presentation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 1500));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
      ],
      child: const _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          home: child,
        );
      },
      child: const MainScreen(),
    );
  }
}
