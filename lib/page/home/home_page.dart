import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/search_view.dart';
import 'package:ulearning_app/page/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/page/home/bloc/home_page_states.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late UserItem userProfile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    "Hello",
                    color: AppColors.primaryThirdElementText,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText('BQT' ?? "", top: 5),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(
                  child: searchView(context, 'search your courses'),
                ),
                SliverToBoxAdapter(
                  child: slidersView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
