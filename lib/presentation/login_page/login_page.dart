import 'package:code_base/core/locators/locators.dart';
import 'package:code_base/core/style/app_text_style.dart';
import 'package:code_base/presentation/login_page/login_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/style/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    diLoginPageBloc.add(const LoginPageStartEvent());
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<LoginPageBloc, LoginPageState>(builder: (context, state) {
      if (state is LoginPageLoadedState) {
        print('>>>>>>>${state}');
        return SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Container(
            color: AppColors.backgroundColor,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: Colors.red,
                  ),
                  child: TextFormField(
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextFormField(
                  controller: passController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      diLoginPageBloc.add(
                        LoginPageSubmitEvent(
                            email: emailController.text,
                            password: passController.text,
                            context: context),
                      );
                    },
                    child: Container(
                      color: Colors.blue,
                      child: Text(
                        'submit',
                        style: AppTextStyle.medium14
                            .copyWith(color: AppColors.backgroundColor),
                      ),
                    ))
              ],
            ),
          ),
        );
      }
      return SafeArea(
        child: Container(
          color: Colors.orangeAccent,
        ),
      );
    }));
  }
}
