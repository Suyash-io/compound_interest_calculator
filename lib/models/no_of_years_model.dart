

class NoOfYearsResponse {
  String? textColor;
  int? textSize;
  String? labelText;
  List<YearsValue>? yearsValues;
  List<ConditionModel>? conditions;

  NoOfYearsResponse({
    this.textColor,
    this.textSize,
    this.labelText,
    this.yearsValues,
    this.conditions,
  });

  factory NoOfYearsResponse.fromJson(Map<String, dynamic> json) => NoOfYearsResponse(
    textColor: json["textColor"],
    textSize: json["textSize"],
    labelText: json["labelText"],
    yearsValues: json["yearsValues"] == null ? [] : List<YearsValue>.from(json["yearsValues"]!.map((x) => YearsValue.fromJson(x))),
    conditions: json["conditions"] == null ? [] : List<ConditionModel>.from(json["conditions"]!.map((x) => ConditionModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "textColor": textColor,
    "textSize": textSize,
    "labelText": labelText,
    "yearsValues": yearsValues == null ? [] : List<dynamic>.from(yearsValues!.map((x) => x.toJson())),
    "conditions": conditions == null ? [] : List<dynamic>.from(conditions!.map((x) => x.toJson())),
  };
}

class ConditionModel {
  int? noOfCompoundYear;
  int? minYear;
  int? maxYear;

  ConditionModel({
    this.noOfCompoundYear,
    this.minYear,
    this.maxYear,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
    noOfCompoundYear: json["noOfCompoundYear"],
    minYear: json["minYear"],
    maxYear: json["maxYear"],
  );

  Map<String, dynamic> toJson() => {
    "noOfCompoundYear": noOfCompoundYear,
    "minYear": minYear,
    "maxYear": maxYear,
  };
}

class YearsValue {
  String? title;
  int? value;

  YearsValue({
    this.title,
    this.value,
  });

  factory YearsValue.fromJson(Map<String, dynamic> json) => YearsValue(
    title: json["title"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
  };
}
