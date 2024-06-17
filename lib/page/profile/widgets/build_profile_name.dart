import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';
import 'package:ulearning_app/page/profile/bloc/profile_states.dart';

Widget buildProfileName(ProfileStates state) {
  return state.userProfile == null
      ? Container(
          child: reusableText("No name found"),
        )
      : Container(
          padding: EdgeInsets.only(left: 50.w, right: 50.w),
          margin: EdgeInsets.only(bottom: 10.h, top: 5.h),
          child: Text(
            state.userProfile?.name ?? "no name given",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
        );
}
