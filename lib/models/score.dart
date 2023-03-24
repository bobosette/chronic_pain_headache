// ignore_for_file: prefer_collection_literals

class Score {
  String? label;
  String? value;

  Score({this.label, this.value});

  Score.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}
