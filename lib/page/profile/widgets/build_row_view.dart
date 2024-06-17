import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';

Widget buildRowView(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _rowView("profile_video.png", "My courses", () {
          // Navigator.of(context).pushNamed(AppRoutes.MY_COURSES);
        }),
        _rowView("profile_book.png", "Buy courses", () {
          // Navigator.of(context).pushNamed(AppRoutes.BUY_COURSES);
        }),
        _rowView("profile_star.png", "4.9", () {}),
      ],
    ),
  );
}

Widget _rowView(String iconPath, String itemName, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
      width: 100.w,
      decoration: BoxDecoration(
          color: AppColors.primaryElement,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: AppColors.primaryElement)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 20.w,
              height: 20.h,
              child: Image.asset("assets/icons/$iconPath")),
          Container(
              margin: EdgeInsets.only(top: 5.h),
              child: reusableText(itemName,
                  color: AppColors.primaryElementText,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );
}
