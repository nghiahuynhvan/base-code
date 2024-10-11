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
        return SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 8.w),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  maxLines: null,
                  style: AppTextStyle.medium16.copyWith(color: Colors.black),
                  onFieldSubmitted: (value) {
                    print('>>>>${value}');
                  },
                  onEditingComplete: () {},
                  controller: emailController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  controller: passController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      diLoginPageBloc.add(
                        LoginPageSubmitEvent(
                            email: emailController.text,
                            password: passController.text,
                            context: context),
                      );
                    },
                    child: Container(
                      child: Text(
                        'submit',
                        style: AppTextStyle.medium16
                            .copyWith(color: AppColors.primaryColor),
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
