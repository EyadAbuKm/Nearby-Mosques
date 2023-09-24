import 'masjid_model.dart';
import 'other_masjid_models.dart';

class MasjidLocation {
  Coordinates? coordinates;
  String? type;

  MasjidLocation({this.coordinates, this.type});

  MasjidLocation.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinates != null) {
    }
    data['type'] = this.type;
    return data;
  }
}
