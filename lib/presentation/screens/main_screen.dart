import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/business_logic/home_cubit/home_page_cubit.dart';
import 'package:wallpaper_app/core/utils/my_colors.dart';

import 'favorite_page.dart';
import 'home_page.dart';
import 'search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final GlobalKey<CurvedNavigationBarState> navigationKey =
      GlobalKey<CurvedNavigationBarState>();
  int pageIndex = 1;

  final pages = [
    const FavoritePage(),
    HomePage(navigationKey: navigationKey),
    const SearchPage(),
  ];

  final items = [
    Icon(
      Icons.favorite,
      size: 27.sp,
    ),
    Icon(
      Icons.home,
      size: 27.sp,
    ),
    Icon(
      Icons.search,
      size: 27.sp,
    )
  ];

  @override
  void initState() {
    BlocProvider.of<HomePageCubit>(context).getAllPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  iconTheme:
                      IconThemeData(color: Theme.of(context).backgroundColor)),
              child: CurvedNavigationBar(
                key: navigationKey,
                backgroundColor: Colors.transparent,
                color: MyColor.blue,
                items: items,
                height: 50.h,
                index: pageIndex,
                onTap: (newIndex) {
                  setState(() {
                    pageIndex = newIndex;
                  });
                },
              ),
            ),
            body: pages[pageIndex],
          ),
        ),
      ),
    );
  }
}
