class MyModel {
  List<Data>? data;

  MyModel({this.data});

  MyModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? uid;
  String? uf;
  String? state;
  int? cases;
  int? deaths;
  int? suspects;
  int? refuses;
  String? datetime;

  Data(
      {this.uid,
      this.uf,
      this.state,
      this.cases,
      this.deaths,
      this.suspects,
      this.refuses,
      this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uf = json['uf'];
    state = json['state'];
    cases = json['cases'];
    deaths = json['deaths'];
    suspects = json['suspects'];
    refuses = json['refuses'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['uf'] = uf;
    data['state'] = state;
    data['cases'] = cases;
    data['deaths'] = deaths;
    data['suspects'] = suspects;
    data['refuses'] = refuses;
    data['datetime'] = datetime;
    return data;
  }
}
