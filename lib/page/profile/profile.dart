import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/page/profile/bloc/profile_blocs.dart';
import 'package:ulearning_app/page/profile/bloc/profile_states.dart';

import 'widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBlocs, ProfileStates>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //for showing profile image
                profileIconAndEditButton(),
                SizedBox(
                  height: 30.h,
                ),
                //for showing profile name
                buildProfileName(state),
                //build row buttons
                buildRowView(context),

                // SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: buildListView(context),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
