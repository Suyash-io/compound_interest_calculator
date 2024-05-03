

class PrincipalAmountField {
  String? hintText;
  String? textColor;
  double? textSize;
  List<MinAmt>? minAmt;
  ErrorMessage? errorMessage;
  int? maxAmount;
  int? minAmount;

  PrincipalAmountField({
    this.hintText,
    this.textColor,
    this.textSize,
    this.minAmt,
    this.minAmount,
    this.maxAmount,
    this.errorMessage,
  });

  factory PrincipalAmountField.fromJson(Map<String, dynamic> json) => PrincipalAmountField(
    hintText: json["hintText"],
    textColor: json["textColor"],
    minAmount: json["minimumAmount"],
    maxAmount: json["maximumAmount"],
    textSize: double.parse(json["textSize"].toString()),
    minAmt: json["minAmt"] == null ? [] : List<MinAmt>.from(json["minAmt"]!.map((x) => MinAmt.fromJson(x))),
    errorMessage: json["errorMessage"] == null ? null : ErrorMessage.fromJson(json["errorMessage"]),
  );

  Map<String, dynamic> toJson() => {
    "hintText": hintText,
    "textColor": textColor,
    "textSize": textSize?.toDouble(),
    "minimumAmount":minAmount,
    "maximumAmount":maxAmount,
    "minAmt": minAmt == null ? [] : List<dynamic>.from(minAmt!.map((x) => x.toJson())),
    "errorMessage": errorMessage?.toJson(),
  };
}

class ErrorMessage {
  String? minimumAmount;
  String? maximumAmount;

  ErrorMessage({
    this.minimumAmount,
    this.maximumAmount,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
    minimumAmount: json["minimumAmount"],
    maximumAmount: json["maximumAmount"],
  );

  Map<String, dynamic> toJson() => {
    "minimumAmount": minimumAmount,
    "maximumAmount": maximumAmount,
  };
}

class MinAmt {
  int? amount;
  int? begin;
  int? end;

  MinAmt({
    this.amount,
    this.begin,
    this.end,
  });

  factory MinAmt.fromJson(Map<String, dynamic> json) => MinAmt(
    amount: json["amount"],
    begin: json["begin"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "begin": begin,
    "end": end,
  };
}
