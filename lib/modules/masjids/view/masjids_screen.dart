import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masjidi/modules/masjids/controller/masjids_controller.dart';
import 'package:masjidi/modules/masjids/view/widgets/masjids_widgets.dart';

import '../../../core/enums/controller_status.dart';

class MasjidsScreen extends StatefulWidget {
  const MasjidsScreen({Key? key}) : super(key: key);

  @override
  State<MasjidsScreen> createState() => _MasjidsScreenState();
}

class _MasjidsScreenState extends State<MasjidsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Masjids".tr),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            GetBuilder<MasjidsController>(builder: (controller) {
              if (controller.status == Status.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.status == Status.error) {
                return Center(
                  child: Text("error".tr),
                );
              } else {
                return buildTheMasjidsList(context);
              }
            })
          ],
        ),
      ),
    );
  }

}


