import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/page/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/page/home/bloc/home_page_events.dart';
import 'package:ulearning_app/page/home/bloc/home_page_states.dart';

Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/icons/art.png"),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/image_2.png")
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index.toInt(),
        decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}
