import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/page/register/bloc/register_blocs.dart';
import 'package:ulearning_app/page/register/bloc/register_states.dart';

import '../../common/widgets/widgets.dart';
import 'bloc/register_events.dart';
import 'register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 5.h,
                      ),
                      child: reusableText(
                          "Enter your details below and free sign up",
                          color: Colors.grey.withOpacity(0.5),
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name",
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                        buildTextField("Enter your user name", "name", "user",
                            (value) {
                          context
                              .read<RegisterBlocs>()
                              .add(UserNameEvent(value));
                        }),
                        reusableText("Email",
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<RegisterBlocs>().add(EmailEvent(value));
                        }),
                        reusableText("Password",
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context
                              .read<RegisterBlocs>()
                              .add(PasswordEvent(value));
                        }),
                        reusableText("Re-enter password",
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                        buildTextField("Re-enter your password to confirm",
                            "password", "lock", (value) {
                          context
                              .read<RegisterBlocs>()
                              .add(RePasswordEvent(value));
                        })
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: reusableText(
                        "By creating an account you have to agree with our them & condition.",
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                  buildLogInAdnRegButton("Sign up", "login", () {
                    // Navigator.of(context).pushNamed("register");
                    RegisterController(context: context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
