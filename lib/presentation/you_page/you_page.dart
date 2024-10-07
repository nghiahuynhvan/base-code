import 'package:code_base/core/style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../core/style/app_colors.dart';

class YouPage extends StatelessWidget {
  const YouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Center(
          child: Text(
            'abc',
            style:
                AppTextStyle.medium14.copyWith(color: AppColors.headingColor),
          ),
        ),
      ),
    );
  }
}
