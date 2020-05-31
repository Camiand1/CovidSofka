import 'country.dart';
import 'global.dart';

class SummaryResponse {
  List<Country> countries;
  String date;
  Global global;

  SummaryResponse({this.countries, this.date, this.global});

  factory SummaryResponse.fromJson(Map<String, dynamic> json) {
    return SummaryResponse(
      countries: json['countries'] != null
          ? (json['countries'] as List).map((i) => Country.fromJson(i)).toList()
          : null,
      date: json['date'],
      global: json['global'] != null ? Global.fromJson(json['global']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.countries != null) {
      data['countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    if (this.global != null) {
      data['global'] = this.global.toJson();
    }
    return data;
  }
}
