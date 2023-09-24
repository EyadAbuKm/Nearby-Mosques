import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masjidi/core/enums/controller_status.dart';
import 'package:masjidi/core/managers/location_manager.dart';
import 'package:masjidi/modules/masjids/controller/masjids_controller.dart';

class MasjidsMap extends StatefulWidget {
  @override
  _MasjidsMapState createState() => _MasjidsMapState();
}

class _MasjidsMapState extends State<MasjidsMap> {
  late GoogleMapController mapController;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasjidsController>(builder: (controller) {
      if (controller.status == Status.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,

            onMapCreated: (GoogleMapController controller) {

                mapController = controller;

            },


            initialCameraPosition: CameraPosition(
              target: Get.find<LocationController>().currentLocation,
              zoom: 15.0, // Initial zoom level
            ),

            markers: controller.getMarkersList().toSet(),
          ),
          Positioned(

            top: 75,
            left: 0,
            right: 0,
            child: CarouselSlider(
              carouselController: controller.carouselController,
              items: controller.masjids.map((location) {
                return InkWell(
                  onTap: () {
                    // Scroll to the tapped item.
                    controller.carouselController.animateToPage(
                      controller.masjids.indexOf(location),
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Card(
                    elevation: 8,
                    child: ListTile(
                      title: Text(location.masjidName ?? ""),
                      subtitle: Text(location.masjidAddress!.description ?? ""),
                      // You can also display additional information here, such as the latitude and longitude.
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 100, // Adjust as needed
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    controller.centeredItemIndex = index;
                  });
                  // When the item in the center changes, animate the map to the associated location.
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        zoom: 16,
                          target: LatLng(
                              controller.masjids[index].masjidLocation!
                                  .coordinates!.values![1],
                              controller.masjids[index].masjidLocation!
                                  .coordinates!.values![0])),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }


  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
