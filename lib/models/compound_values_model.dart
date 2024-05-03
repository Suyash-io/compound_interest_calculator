

class CompoundResponse {
  String? textColor;
  int? textSize;
  String? labelText;
  List<CompoundValue>? compoundValues;

  CompoundResponse({
    this.textColor,
    this.textSize,
    this.labelText,
    this.compoundValues,
  });

  factory CompoundResponse.fromJson(Map<String, dynamic> json) => CompoundResponse(
    textColor: json["textColor"],
    textSize: json["textSize"],
    labelText: json["labelText"],
    compoundValues: json["compoundValues"] == null ? [] : List<CompoundValue>.from(json["compoundValues"]!.map((x) => CompoundValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "textColor": textColor,
    "textSize": textSize,
    "labelText": labelText,
    "compoundValues": compoundValues == null ? [] : List<dynamic>.from(compoundValues!.map((x) => x.toJson())),
  };
}

class CompoundValue {
  String? title;
  int? value;
  int? roi;

  CompoundValue({
    this.title,
    this.value,
    this.roi,
  });

  factory CompoundValue.fromJson(Map<String, dynamic> json) => CompoundValue(
    title: json["title"],
    value: json["value"],
    roi:json["roi"]
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
    "roi":roi
  };
}
