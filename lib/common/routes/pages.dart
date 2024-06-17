// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/page/application/application_page.dart';
import 'package:ulearning_app/page/application/bloc/app_blocs.dart';
import 'package:ulearning_app/page/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/page/home/home_page.dart';
import 'package:ulearning_app/page/profile/bloc/profile_blocs.dart';
import 'package:ulearning_app/page/profile/profile.dart';
import 'package:ulearning_app/page/register/bloc/register_blocs.dart';
import 'package:ulearning_app/page/register/register.dart';
import 'package:ulearning_app/page/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/page/sign_in/sign_in.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/page/welcome/welcome.dart';

import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      // PageEntity(
      //     route: AppRoutes.INITIAL,
      //     page: const Welcome(),
      //     bloc: BlocProvider(
      //       create: (_) => WelcomeBlocs(),
      //     )),
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),

      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.PROFILE,
          page: const ProfilePage(),
          bloc: BlocProvider(
            create: (_) => ProfileBlocs(),
          )),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // kiểm tra việc xử lý tên tuyến đường khi trình điều hướng được kích hoạt.
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
