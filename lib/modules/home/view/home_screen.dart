import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/home_widgets.dart';
import 'widgets/language_button.dart';
import 'widgets/theme_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home".tr),
        automaticallyImplyLeading:
            false, // This line removes the back button space
        actions: [
          buildChangeLanguageButton(context),
          buildChangeThemeButton(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            buildHomeTopSection(context),
            Spacer(),
            buildBottomButtonsSection(),
            SizedBox(
              height: 100.h,
            ),

          ],
        ),
      ),
    );
  }
}
