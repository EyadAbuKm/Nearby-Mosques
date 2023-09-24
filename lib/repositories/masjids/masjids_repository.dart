
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masjidi/core/api/api.dart';
import 'package:masjidi/core/enums/request_type_enum.dart';
import 'package:masjidi/core/managers/location_manager.dart';
import 'package:masjidi/repositories/masjids/models/masjid_model.dart';


class MasjidRepository{
  

  Future<List<MasjidModel>> getMasjids({required int page, required int pageSize})async{
    /// Prepare the end point
    LatLng currentLocation = Get.find<LocationController>().currentLocation;
    final endPoint = "SearchMasjids/query/lat\$${currentLocation.latitude},lng\$${currentLocation.longitude},rad\$3000/";
    /// call the api
    var data = await ApiManager.instance.execute(type: RequestType.GET, endPoint: endPoint);

    /// Convert the returned data the needed type
    final masjidList = (data as List).map((e) => MasjidModel.fromJson(e)).toList();
    return masjidList;
  }
}