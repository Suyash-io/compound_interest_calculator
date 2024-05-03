

import 'package:compound_interest_calculator/screens/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantWidgets {
  static inputDecoration(CalcController calController)  => InputDecoration(
  labelText: calController.principalFieldProp.hintText,
  contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
  focusColor: Colors.white,
  hintText:calController.principalFieldProp.hintText,
  border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey),
  borderRadius: BorderRadius.circular(15)
  ),
  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey),
  borderRadius: BorderRadius.circular(15)
  ),
  focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black,width: 1),
  borderRadius: BorderRadius.circular(15)
  )
  );
}