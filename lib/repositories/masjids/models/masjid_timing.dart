class MasjidTimings {
  String? asr;
  String? fajr;
  String? isha;
  String? jumah;
  String? maghrib;
  String? zuhr;

  MasjidTimings(
      {this.asr, this.fajr, this.isha, this.jumah, this.maghrib, this.zuhr});

  MasjidTimings.fromJson(Map<String, dynamic> json) {
    asr = json['asr'] ;
    fajr = json['fajr'] ;
    isha = json['isha'] ;
    jumah = json['jumah'];
    maghrib =
    json['maghrib'];
    zuhr = json['zuhr'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}