

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../../../repositories/masjids/masjids.dart';
import '../../../../shared/widgets/shiming_widget.dart';
import '../../controller/masjids_controller.dart';
import 'masjid_card.dart';

Flexible buildTheMasjidsList(BuildContext context) {
  final controller = Get.find<MasjidsController>();
  return Flexible(
    child: PaginatedList<MasjidModel>(
      loadingIndicator: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Center(
          child: ShimmerWidget(
            height: 100.w,
            width: 320.w,
            radius: 15.r,
          ),
        ),
      ),
      items: controller.masjids,
      isRecentSearch: false,
      isLastPage: controller.isLastPage,
      onLoadMore: (index) => controller.fetchMasjids(),
      builder: (poke, index) => MasjidCard(masjid:poke),
    ),
  );
}


