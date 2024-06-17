import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/page/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/page/sign_in/bloc/sign_in_states.dart';
import 'package:ulearning_app/page/sign_in/sign_in_controller.dart';

import 'bloc/sign_in_events.dart';
import '../../common/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign In'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                      child: reusableText("Or use your email account to login.",
                          color: Colors.grey.withOpacity(0.5),
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText(
                            "Email",
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText(
                            "Password",
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your your password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          })
                        ],
                      ),
                    ),
                    forgotPassword(),
                    SizedBox(
                      height: 70.h,
                    ),
                    buildLogInAdnRegButton("Log In", "login", () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    buildLogInAdnRegButton("Sign Up", "register", () {
                      Navigator.of(context).pushNamed("/register");
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
