import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallpaper_app/business_logic/home_cubit/home_page_cubit.dart';
import 'package:wallpaper_app/core/utils/my_colors.dart';
import '../widgets/home_page_widget/build_photo_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.navigationKey});
  final GlobalKey<CurvedNavigationBarState> navigationKey;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController();
  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<HomePageCubit, HomePageState>(
        listener: (context, state) {
          if (state is PhotosLoaded) {
            if (_refreshController.isRefresh) {
              _refreshController.refreshCompleted();
              _refreshController.refreshCompleted();
            }
            if (_refreshController.isLoading) {
              _refreshController.refreshCompleted();
              _refreshController.refreshCompleted();
            }
          }
          if (state is PhotosLoadinge) {
            if (_refreshController.isRefresh) {
              _refreshController.refreshCompleted();
              _refreshController.refreshCompleted();
            }
            if (_refreshController.isLoading) {
              _refreshController.refreshCompleted();
              _refreshController.refreshCompleted();
            }
          }
        },
        child: Scaffold(
          appBar: _appBar(),
          body: Padding(
            padding: EdgeInsets.fromLTRB(0, 10.h, 0, 2.h),
            child: Column(
              children: [
                Expanded(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    onRefresh: () async {
                      BlocProvider.of<HomePageCubit>(context).getAllPhoto();
                      await Future.delayed(const Duration(milliseconds: 1000));
                      _refreshController.loadComplete();
                    },
                    header: const WaterDropHeader(waterDropColor: MyColor.blue),
                    enablePullDown: true,
                    onLoading: () async {
                      BlocProvider.of<HomePageCubit>(context).loadMorePhoto();
                      await Future.delayed(const Duration(milliseconds: 1000));
                      _refreshController.loadComplete();
                    },
                    child: CustomScrollView(
                      slivers: [
                        BuildPhotosViewer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? _appBar() {
    return AppBar(
      backgroundColor: MyColor.blue,
      leading: const SizedBox(),
      actions: [
        IconButton(
          onPressed: (() {
            final navigationKeyState = widget.navigationKey.currentState;
            navigationKeyState!.setPage(2);
          }),
          icon: Icon(
            Icons.search,
            size: 22.sp,
          ),
        )
      ],
      centerTitle: true,
      title: Text(
        'popular wallpaper',
        style: TextStyle(
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
