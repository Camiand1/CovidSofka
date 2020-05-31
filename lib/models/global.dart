class Global {
  int newConfirmed;
  int newDeaths;
  int newRecovered;
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;

  Global(
      {this.newConfirmed,
      this.newDeaths,
      this.newRecovered,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered});

  factory Global.fromJson(Map<String, dynamic> json) {
    return Global(
      newConfirmed: json['newConfirmed'],
      newDeaths: json['newDeaths'],
      newRecovered: json['newRecovered'],
      totalConfirmed: json['totalConfirmed'],
      totalDeaths: json['totalDeaths'],
      totalRecovered: json['totalRecovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newConfirmed'] = this.newConfirmed;
    data['newDeaths'] = this.newDeaths;
    data['newRecovered'] = this.newRecovered;
    data['totalConfirmed'] = this.totalConfirmed;
    data['totalDeaths'] = this.totalDeaths;
    data['totalRecovered'] = this.totalRecovered;
    return data;
  }
}
