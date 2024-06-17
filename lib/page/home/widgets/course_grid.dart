// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ulearning_app/common/entities/course.dart';
// import 'package:ulearning_app/common/values/colors.dart';
// import 'package:ulearning_app/common/values/constant.dart';

// Widget courseGrid(CourseItem item) {
//   return cachedNetworkImage(AppConstants.SERVER_UPLOADS + item.thumbnail!,
//       child: Container(
//         padding: EdgeInsets.all(12.w),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.w),
//             image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: NetworkImage(
//                     AppConstants.SERVER_UPLOADS + item.thumbnail!))),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               item.name ?? "",
//               maxLines: 1,
//               overflow: TextOverflow.fade,
//               textAlign: TextAlign.left,
//               softWrap: false,
//               style: TextStyle(
//                   color: AppColors.primaryElementText,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 11.sp),
//             ),
//             SizedBox(
//               height: 5.h,
//             ),
//             Text(
//               item.description ?? "",
//               maxLines: 1,
//               overflow: TextOverflow.fade,
//               textAlign: TextAlign.left,
//               softWrap: false,
//               style: TextStyle(
//                   color: AppColors.primaryFourthElementText,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 8.sp),
//             )
//           ],
//         ),
//       ),
//       defaultImage: "assets/icons/image.png");
// }
