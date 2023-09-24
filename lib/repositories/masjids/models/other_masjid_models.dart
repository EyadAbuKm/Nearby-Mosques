class Distance {
  String? nil;

  Distance({this.nil});

  Distance.fromJson(Map<String, dynamic> json) {
    nil = json['@nil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@nil'] = this.nil;
    return data;
  }
}

class Id {
  String? sA;
  String? sB;
  String? sC;

  Id({this.sA, this.sB, this.sC});

  Id.fromJson(Map<String, dynamic> json) {
    sA = json['_a'];
    sB = json['_b'];
    sC = json['_c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_a'] = this.sA;
    data['_b'] = this.sB;
    data['_c'] = this.sC;
    return data;
  }
}



class Coordinates {
  List<dynamic>? values;

  Coordinates({this.values});

  Coordinates.fromJson(List<dynamic> json) {
    values = json;
  }


}

