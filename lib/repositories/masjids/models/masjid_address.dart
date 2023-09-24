class MasjidAddress {
  String? city;
  String? country;
  String? description;
  String? googlePlaceId;
  String? locality;
  String? phone;
  String? state;
  String? street;
  String? zipcode;

  MasjidAddress(
      {this.city,
        this.country,
        this.description,
        this.googlePlaceId,
        this.locality,
        this.phone,
        this.state,
        this.street,
        this.zipcode});

  MasjidAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    description = json['description'];
    googlePlaceId = json['googlePlaceId'];
    locality = json['locality'];
    phone = json['phone'] ;
    state = json['state'];
    street = json['street'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['description'] = this.description;
    data['googlePlaceId'] = this.googlePlaceId;
    data['locality'] = this.locality;
    if (this.phone != null) {
      data['phone'] = this.phone;
    }
    data['state'] = this.state;
    data['street'] = this.street;
    data['zipcode'] = this.zipcode;
    return data;
  }
}
