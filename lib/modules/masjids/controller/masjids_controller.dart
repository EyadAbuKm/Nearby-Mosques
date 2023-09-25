import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masjidi/core/enums/controller_status.dart';
import 'package:masjidi/repositories/masjids/masjids.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/utils/load_marker_image.dart';

class MasjidsController extends GetxController {
  /// A Repository to provide the connection with the Back-end
  late MasjidRepository _masjidRepository;

  CarouselController carouselController = CarouselController();

  /// Fields needed for the pagination
  int pageSize = 10;
  int page = 0;

  /// TODO Make it false when the data source support pagination
  bool isLastPage = true;
  int centeredItemIndex = 0;

  /// the current status that needed for the rendering
  Status status = Status.initial;

  List<MasjidModel> masjids = [];


  ///Map markers
  var coloredImage;

  @override
  void onInit() {
    _masjidRepository = MasjidRepository();
    getBytesFromAsset("assets/images/colored_mosque.png",150.r).then((value) => coloredImage= value);
    fetchMasjids(isFirst: true);
    super.onInit();
  }

  /// isFirst is for the first time of loading, that's mean it is not load more
  void fetchMasjids({isFirst = false}) async {
    status = isFirst ? Status.loading : Status.loadingMore;
    update();
    try {
      var result =
          await _masjidRepository.getMasjids(page: page, pageSize: pageSize);

      masjids.addAll(result);

      if (result.isEmpty) {
        isLastPage = true;
      } else {
        page++;
      }
      status = Status.loaded;
    } catch (e) {
      status = Status.error;
    }

    update();
  }

  List<Marker> getMarkersList() {
    return masjids.map((masjid) {
      int index =
          masjids.indexOf(masjid); // Get the index of the current masjid

      return Marker(
          icon: centeredItemIndex == index
              ? BitmapDescriptor.fromBytes(coloredImage)
              : BitmapDescriptor.defaultMarker,
          markerId: MarkerId(masjid.masjidId ?? masjid.iId?? Random().nextInt(1000).toString()),
          position: masjid.location(),
          infoWindow: infoWindow(masjid),
          onTap: () {
            onTapMarker(masjid);
          });
    }).toList();
  }

  InfoWindow infoWindow(MasjidModel masjid) {
    return InfoWindow(
            title: masjid.masjidName ?? "",
            snippet: masjid.masjidAddress!.description ?? "",
            onTap: () async {
              final url =
                  "https://www.google.com/maps/dir/?api=1&destination=${masjid.location().latitude},${masjid.location().longitude}";
              await launchUrl(Uri.parse(url));
            });
  }

  void onTapMarker(masjid ){
    carouselController.animateToPage(
      masjids.indexOf(masjid),
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    update();
  }
}
