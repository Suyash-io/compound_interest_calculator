

class RoiResponse {
  String? textColor;
  double? textSize;
  String? labelText;
  List<RoiList>? roiList;


  RoiResponse({
    this.textColor,
    this.textSize,
    this.labelText,
    this.roiList,
  });

  factory RoiResponse.fromJson(Map<String, dynamic> json) => RoiResponse(
    textColor: json["textColor"],
    textSize: double.parse(json["textSize"].toString()),
    labelText: json["labelText"],
    roiList: json["roiList"] == null ? [] : List<RoiList>.from(json["roiList"]!.map((x) => RoiList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "textColor": textColor,
    "textSize": textSize.toString(),
    "labelText": labelText,
    "roiList": roiList == null ? [] : List<dynamic>.from(roiList!.map((x) => x.toJson())),
  };
}

class RoiList {
  String? title;
  int? value;

  RoiList({
    this.title,
    this.value,
  });

  factory RoiList.fromJson(Map<String, dynamic> json) => RoiList(
    title: json["title"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
  };
}
