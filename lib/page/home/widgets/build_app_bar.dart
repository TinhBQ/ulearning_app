import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/constant.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          // GestureDetector(
          //   child: Container(
          //     width: 40.w,
          //     height: 40.h,
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             image: NetworkImage(
          //                 "${AppConstants.SERVER_API_URL}$avatar"))),
          //   ),
          // )
        ],
      ),
    ),
  );
}
