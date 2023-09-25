import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../shared/widgets/app_elevated_button.dart';

Widget buildHomeTopSection(BuildContext context) {
  return Column(
    children: [
      Lottie.asset("assets/animations/mosque.json"),
      SizedBox(height: 24.h,),
      Text("Welcome to Masjidi".tr),
      SizedBox(height: 24.h,),
      SizedBox(
        child: DefaultTextStyle(
          style:  TextStyle(
            fontSize: 26.sp,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.displayMedium!.color,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FadeAnimatedText('Find the nearest Masjid'.tr),
              FadeAnimatedText('When it\'s time for salaah'.tr),
              FadeAnimatedText('Never miss a prayer in congregation'.tr),
            ],
            onTap: () {
            },
          ),
        ),
      )
    ],
  );
}

Widget buildBottomButtonsSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      AppElevatedButton(
        height: 150.w,
        width: 150.w,
        onPressed: () {
          Get.toNamed(Routes.MASJIDS_MAP);
        },
        child: Column(
          children: [
            Text("MasjidsOnMap".tr),
            SizedBox(height: 8.h,),
            Icon(Icons.map_outlined,size: 60.r,)

          ],
        ),
        color: Colors.blue[800],
      ),
      SizedBox(
        height: 12.h,
      ),
      AppElevatedButton(
        height: 150.w,
        width: 150.w,
        onPressed: () {
          Get.toNamed(Routes.MASJIDS);
        },
        child: Column(
          children: [
            Text("Masjids".tr),
            SizedBox(height: 8.h,),
            Icon(Icons.list_alt,size: 60.r,)
          ],
        ),
        color: Colors.blue[200],
      ),
    ],
  );
}