
import 'dart:math';

import 'package:compound_interest_calculator/models/compound_values_model.dart';
import 'package:compound_interest_calculator/models/loan_amount_props_model.dart';
import 'package:compound_interest_calculator/models/roi_props_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/no_of_years_model.dart';

class CalcController extends GetxController {
  TextEditingController principalAmt = TextEditingController();
  String errLoanAmt = '';
  PrincipalAmountField principalFieldProp = PrincipalAmountField();
  RoiResponse roiProp = RoiResponse();
  CompoundResponse compoundProp = CompoundResponse();
  NoOfYearsResponse noOfYearsProp = NoOfYearsResponse();
  List<RoiList> roiFilter = [];
  List<CompoundValue> compoundFilter = [];
  List<YearsValue> yearsFilter = [];
  int? roiSelectedVal;
  int? compoundSelectedVal;
  int? yearsSelectedVal;
  @override
  void onInit() {
    // TODO: implement onInit
    loadProps();
    super.onInit();
  }

  loadProps() {
    principalFieldProp = PrincipalAmountField.fromJson(principalJson);
    roiProp = RoiResponse.fromJson(rOIJson);
    roiFilter = roiProp.roiList ?? [];
    compoundProp = CompoundResponse.fromJson(compoundYearJson);
    // compoundSelectedVal.value = compoundProp.compoundValues!.first;
    compoundFilter = compoundProp.compoundValues ?? [];
    noOfYearsProp = NoOfYearsResponse.fromJson(numYearJson);
    // yearsSelectedVal.value = noOfYearsProp.yearsValues!.first;
    yearsFilter = noOfYearsProp.yearsValues ?? [];
  }

  int? validateAmount(GlobalKey<FormFieldState> key) {
    MinAmt tempItem = MinAmt();
    int loanAmt = int.parse(principalAmt.text);
    roiFilter = roiProp.roiList??[];
    if (loanAmt < principalFieldProp.minAmount!) {
      errLoanAmt = principalFieldProp.errorMessage!.minimumAmount!;
      key.currentState!.validate();
    } else if (loanAmt > principalFieldProp.maxAmount!) {
      errLoanAmt = principalFieldProp.errorMessage!.maximumAmount!;
      key.currentState!.validate();
    } else {
      errLoanAmt = '';
      key.currentState!.validate();
      try {
        for (MinAmt item in principalFieldProp.minAmt ?? []) {
          if (loanAmt <= item.amount!) {
            tempItem = item;
            break;
          }
        }
        if (tempItem.amount == null) {
          roiFilter = roiProp.roiList!.where((element) => principalFieldProp.minAmt!.last.end! <= element.value!).toList();
          return principalFieldProp.minAmt!.last.end!;
        }else{
          roiFilter = roiProp.roiList!
              .where((element) => (element.value! >= tempItem.begin! &&
              element.value! <= tempItem.end!))
              .toList();
        }

        return tempItem.begin;
      } catch (e) {
        print(e);
      }
    }
    return null;
  }

  int? populateCompoundYear(int val) {
    int? result;
    List<CompoundValue> tempList = compoundProp.compoundValues ?? [];
    compoundFilter = tempList;
    CompoundValue tempItem = CompoundValue();
    for (CompoundValue item in tempList.reversed) {
      if (roiSelectedVal! < item.roi!) {
        tempItem = item;
        break;
      }
    }
    if(tempItem.value !=null){
      compoundFilter = compoundProp.compoundValues!.where((element) => element.value! == tempItem.value!).toList();
      return tempItem.value!;
    }
    return result;
  }

  int? populateNoOfYears(int val) {
    int? result;
    List<YearsValue> tempList = noOfYearsProp.yearsValues??[];
    yearsFilter = tempList;
    List<ConditionModel> conditions = noOfYearsProp.conditions??[];
    for(ConditionModel item in conditions){
      if(compoundSelectedVal==item.noOfCompoundYear!){
        yearsFilter = noOfYearsProp.yearsValues!.where((element) => (element.value! >= item.minYear! && element.value!<= item.maxYear!)).toList();
        return item.minYear;
      }
    }

    return result;
  }

  num? calculateInterest() {
    num? result;
    int loanAmt = int.parse(principalAmt.text);
    try{
      result = (loanAmt * pow(1+(roiSelectedVal!/compoundSelectedVal!),(compoundSelectedVal!*yearsSelectedVal!)));
    }catch(e){
      print(e);
    }
    return result;
  }

  void resetCalculator() {
    principalAmt.clear();
    roiFilter = roiProp.roiList ?? [];
    compoundFilter = compoundProp.compoundValues ?? [];
    yearsFilter = noOfYearsProp.yearsValues ?? [];
    roiSelectedVal = null;
    compoundSelectedVal = null;
    yearsSelectedVal = null;
  }
}
var outputProps = {
  "textColor": "0xFF3C5B6F",
  "textSize": 20,
  "labelText": "No.of Years",
  "displayMode":
    {
      "snackBarMessage" : "calculating",
      "popUpMessage" : ""
    }

};
var numYearJson = {
  "textColor": "0xFF3C5B6F",
  "textSize": 20,
  "labelText": "No.of Years",
  "yearsValues": [
    {"title": "1", "value": 1},
    {"title": "2", "value": 2},
    {"title": "3", "value": 3},
    {"title": "4", "value": 4},
    {"title": "5", "value": 5},
    {"title": "6", "value": 6},
    {"title": "7", "value": 7},
    {"title": "8", "value": 8},
    {"title": "9", "value": 9},
    {"title": "10", "value": 10},
    {"title": "11", "value": 11},
    {"title": "12", "value": 12},
    {"title": "13", "value": 13},
    {"title": "14", "value": 14},
    {"title": "15", "value": 15},
    {"title": "16", "value": 16},
    {"title": "17", "value": 17},
    {"title": "18", "value": 18},
    {"title": "19", "value": 19},
    {"title": "20", "value": 20},
    {"title": "21", "value": 21},
    {"title": "22", "value": 22},
    {"title": "23", "value": 23},
    {"title": "24", "value": 24},
    {"title": "25", "value": 25},
    {"title": "26", "value": 26},
    {"title": "27", "value": 27},
    {"title": "28", "value": 28},
    {"title": "29", "value": 29},
    {"title": "30", "value": 30}
  ],
  "conditions" : [
    {
      "noOfCompoundYear": 1,
      "minYear":1,
      "maxYear":10
    },
    {
      "noOfCompoundYear": 2,
      "minYear":1,
      "maxYear":20
    },
    {
      "noOfCompoundYear": 4,
      "minYear":1,
      "maxYear":30
    }
  ]
};
var compoundYearJson = {
  "textColor": "0xFF3C5B6F",
  "textSize": 20,
  "labelText": "Compound in Year",
  "compoundValues": [
    {"title": "1", "value": 1, "roi": 12},
    {"title": "2", "value": 2, "roi": 6},
    {"title": "4", "value": 4, "roi": 3},
  ]
};
var rOIJson = {
  "textColor": "0xFF3C5B6F",
  "textSize": 20,
  "labelText": "ROI",
  "roiList": [
    {"title": "1%", "value": 1},
    {"title": "2%", "value": 2},
    {"title": "3%", "value": 3},
    {"title": "4%", "value": 4},
    {"title": "5%", "value": 5},
    {"title": "6%", "value": 6},
    {"title": "7%", "value": 7},
    {"title": "8%", "value": 8},
    {"title": "9%", "value": 9},
    {"title": "10%", "value": 10},
    {"title": "11%", "value": 11},
    {"title": "12%", "value": 12},
    {"title": "13%", "value": 13},
    {"title": "14%", "value": 14},
    {"title": "15%", "value": 15}
  ]
};
var principalJson = {
  "hintText": "Loan Amount",
  "textColor": "0xFF3C5B6F",
  "textSize": 20,
  "minAmt": [
    {"amount": 10000, "begin": 1, "end": 3},
    {"amount": 50000, "begin": 4, "end": 7},
    {"amount": 75000, "begin": 8, "end": 12}
  ],
  "minimumAmount": 5000,
  "maximumAmount": 100000,
  "errorMessage": {
    "minimumAmount": "please enter amount above 5000",
    "maximumAmount": "please enter amount below 100000"
  }
};
