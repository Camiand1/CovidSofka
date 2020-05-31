class Country {
  String country;
  String countryCode;
  String date;
  int newConfirmed;
  int newDeaths;
  int newRecovered;
  String slug;
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;

  Country(
      {this.country,
      this.countryCode,
      this.date,
      this.newConfirmed,
      this.newDeaths,
      this.newRecovered,
      this.slug,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
      countryCode: json['countryCode'],
      date: json['date'],
      newConfirmed: json['newConfirmed'],
      newDeaths: json['newDeaths'],
      newRecovered: json['newRecovered'],
      slug: json['slug'],
      totalConfirmed: json['totalConfirmed'],
      totalDeaths: json['totalDeaths'],
      totalRecovered: json['totalRecovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['date'] = this.date;
    data['newConfirmed'] = this.newConfirmed;
    data['newDeaths'] = this.newDeaths;
    data['newRecovered'] = this.newRecovered;
    data['slug'] = this.slug;
    data['totalConfirmed'] = this.totalConfirmed;
    data['totalDeaths'] = this.totalDeaths;
    data['totalRecovered'] = this.totalRecovered;
    return data;
  }
}
