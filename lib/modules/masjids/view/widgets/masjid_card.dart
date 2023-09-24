import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../repositories/masjids/masjids.dart';

class MasjidCard extends StatelessWidget {
  final MasjidModel masjid;

  const MasjidCard({super.key, required this.masjid});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 8.h),
        child: InkWell(
          onTap: () async {
            final url =
                "https://www.google.com/maps/dir/?api=1&destination=${masjid.location().latitude},${masjid.location().longitude}";
            await launchUrl(Uri.parse(url));
          },
          child: Card(
            child: ListTile(
              leading: Icon(Icons.mosque),
              title: Text(
                masjid.masjidName ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 17.sp),
              ),
              subtitle: Text(masjid.masjidAddress!.description ?? ""),
            ),
          ),
        ));
  }
}
