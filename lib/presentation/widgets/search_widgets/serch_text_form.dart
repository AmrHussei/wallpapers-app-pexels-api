import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/business_logic/search_cubit/search_cubit.dart';
import 'package:wallpaper_app/core/utils/my_colors.dart';

class SerchFormFiled extends StatefulWidget {
  const SerchFormFiled({
    super.key,
    required this.textInputType,
    required this.prefixIcon,
    required this.hintText,
  });

  final TextInputType textInputType;
  final Widget prefixIcon;
  final String hintText;

  @override
  State<SerchFormFiled> createState() => _SerchFormFiledState();
}

class _SerchFormFiledState extends State<SerchFormFiled> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: ((query) {
        BlocProvider.of<SearchCubit>(context)
            .searchForPhoto(query: query.toString());
      }),
      cursorColor: Colors.black,
      autofocus: true,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _controller.text.isNotEmpty
            ? null
            : IconButton(
                onPressed: (() {
                  BlocProvider.of<SearchCubit>(context)
                      .searchForPhoto(query: '');
                  _controller.clear();
                }),
                icon: Icon(
                  Icons.close,
                  color: Colors.black45,
                  size: 21.sp,
                ),
              ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: BorderSide(color: MyColor.pink),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: MyColor.blue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
