
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'masjid_address.dart';
import 'masjid_location.dart';
import 'masjid_timing.dart';
import 'other_masjid_models.dart';

class MasjidModel {
  Distance? distance;
  String? iId;
  MasjidAddress? masjidAddress;
  String? masjidCreatedby;
  String? masjidCreatedon;
  String? masjidId;
  MasjidLocation? masjidLocation;
  String? masjidModifiedby;
  String? masjidModifiedon;
  String? masjidName;
  Distance? masjidPic;
  MasjidTimings? masjidTimings;
  dynamic notMasjid;

  MasjidModel(
      {this.distance,
        this.iId,
        this.masjidAddress,
        this.masjidCreatedby,
        this.masjidCreatedon,
        this.masjidId,
        this.masjidLocation,
        this.masjidModifiedby,
        this.masjidModifiedon,
        this.masjidName,
        this.masjidPic,
        this.masjidTimings,
        this.notMasjid});

  MasjidModel.fromJson(Map<String, dynamic> json) {
    distance = json['Distance'] != null
        ? new Distance.fromJson(json['Distance'])
        : null;
    iId = json['_id'] ;
    masjidAddress = json['masjidAddress'] != null
        ? new MasjidAddress.fromJson(json['masjidAddress'])
        : null;
    masjidCreatedby = json['masjidCreatedby'];
    masjidCreatedon = json['masjidCreatedon'];
    masjidId = json['masjidId'];
    masjidLocation = json['masjidLocation'] != null
        ? new MasjidLocation.fromJson(json['masjidLocation'])
        : null;
    masjidModifiedby = json['masjidModifiedby'];
    masjidModifiedon = json['masjidModifiedon'];
    masjidName = json['masjidName'];
    masjidPic = json['masjidPic'] != null
        ? new Distance.fromJson(json['masjidPic'])
        : null;
    masjidTimings = json['masjidTimings'] != null
        ? new MasjidTimings.fromJson(json['masjidTimings'])
        : null;
    notMasjid = json['notMasjid'];
  }

  LatLng location(){
    return LatLng(masjidLocation!.coordinates!.values![1],
        masjidLocation!.coordinates!.values![0]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['Distance'] = this.distance!.toJson();
    }
    if (this.iId != null) {
      data['_id'] = this.iId!;
    }
    if (this.masjidAddress != null) {
      data['masjidAddress'] = this.masjidAddress!.toJson();
    }
    data['masjidCreatedby'] = this.masjidCreatedby;
    data['masjidCreatedon'] = this.masjidCreatedon;
    data['masjidId'] = this.masjidId;
    if (this.masjidLocation != null) {
      data['masjidLocation'] = this.masjidLocation!.toJson();
    }
    data['masjidModifiedby'] = this.masjidModifiedby;
    data['masjidModifiedon'] = this.masjidModifiedon;
    data['masjidName'] = this.masjidName;
    if (this.masjidPic != null) {
      data['masjidPic'] = this.masjidPic!.toJson();
    }
    if (this.masjidTimings != null) {
      data['masjidTimings'] = this.masjidTimings!.toJson();
    }
    data['notMasjid'] = this.notMasjid;
    return data;
  }
}


