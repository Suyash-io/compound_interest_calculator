import 'package:compound_interest_calculator/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'calculator_controller.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formFieldKey = GlobalKey<FormFieldState>();
  final calController = Get.put(CalcController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compound Interest Calculator'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFFCFFE0), Color(0xFFFFFBDA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: _formFieldKey,
                controller: calController.principalAmt,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: calController.principalFieldProp.textSize ?? 20,
                    color: Color(int.parse(
                        calController.principalFieldProp.textColor!))),
                maxLength: 7,
                decoration: ConstantWidgets.inputDecoration(calController),
                validator: (value) {
                  return calController.errLoanAmt=="" ?null:calController.errLoanAmt;
                },
                onEditingComplete: () {
                  if(calController.principalAmt.text.isNotEmpty){
                    calController.roiSelectedVal= calController.validateAmount(_formFieldKey);
                  }
                  FocusScope.of(context).unfocus();
                  setState(() {

                  });
                },
                onTapOutside: (val) {
                  if(calController.principalAmt.text.isNotEmpty){
                    calController.roiSelectedVal= calController.validateAmount(_formFieldKey);
                  }
                  FocusScope.of(context).unfocus();
                  setState(() {

                  });
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
               DropdownButtonHideUnderline(
                    child: DropdownButtonFormField2(
                  items: calController.roiFilter
                      .map((item) => DropdownMenuItem(
                            value: item.value,
                            child: Text(item.title??'-',style: TextStyle(color: Color(int.parse(calController.roiProp.textColor!))),),
                          ))
                      .toList(),
                      isExpanded: true,
                      value: calController.roiSelectedVal,
                      onChanged: (val) {
                        calController.roiSelectedVal = val;
                        calController.compoundSelectedVal= calController.populateCompoundYear(val??0);
                        setState(() {

                        });
                      },
                      validator: (val) {
                            return val==null? 'Please select valid ROI':null;
                      },
                      hint:  Text(
                        'ROI',
                        style: TextStyle(fontSize: 14,color:Color(int.parse(calController.roiProp.textColor!))),
                      ),
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding: const EdgeInsets.symmetric(vertical: 7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                ),

              SizedBox(
                height: size.height * 0.02,
              ),
               DropdownButtonFormField2(
                 items: calController.compoundFilter
                     .map((item) => DropdownMenuItem(
                   value: item.value,
                   child: Text(item.title??'-',style: TextStyle(color: Color(int.parse(calController.compoundProp.textColor!))),),
                 ))
                     .toList(),
                 isExpanded: true,
                 value: calController.compoundSelectedVal,
                 onChanged: (val) {
                   calController.compoundSelectedVal = val!;
                   calController.yearsSelectedVal = calController.populateNoOfYears(val);
                   setState(() {

                   });
                 },
                 validator: (val) {
                   return val==null? 'Please select valid Compound Year':null;
                 },
                 hint:  Text(
                   calController.compoundProp.labelText??'-',
                   style: TextStyle(fontSize: 14,color:Color(int.parse(calController.compoundProp.textColor!))),
                 ),
                 decoration: InputDecoration(
                   // Add Horizontal padding using menuItemStyleData.padding so it matches
                   // the menu padding when button's width is not specified.
                   contentPadding: const EdgeInsets.symmetric(vertical: 7),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                   ),
                   // Add more decoration..
                 ),
                 iconStyleData: const IconStyleData(
                   icon: Icon(
                     Icons.arrow_drop_down,
                     color: Colors.black45,
                   ),
                   iconSize: 24,
                 ),
                 dropdownStyleData: DropdownStyleData(
                   maxHeight: 200,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                   ),
                 ),
                 menuItemStyleData: const MenuItemStyleData(
                   padding: EdgeInsets.symmetric(horizontal: 16),
                 ),
               ),

              SizedBox(
                height: size.height * 0.02,
              ),
               DropdownButtonFormField2(
                 items: calController.yearsFilter!
                     .map((item) => DropdownMenuItem(
                   value: item.value,
                   child: Text(item.title??'-',style: TextStyle(color: Color(int.parse(calController.noOfYearsProp.textColor!))),),
                 ))
                     .toList(),
                 isExpanded: true,
                 decoration: InputDecoration(
                   // Add Horizontal padding using menuItemStyleData.padding so it matches
                   // the menu padding when button's width is not specified.
                   contentPadding: const EdgeInsets.symmetric(vertical: 7),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                   ),
                   // Add more decoration..
                 ),
                 value: calController.yearsSelectedVal,
                 onChanged: (val) {
                   calController.yearsSelectedVal = val!;
                   setState(() {

                   });
                 },
                 validator: (val) {
                   return val==null? 'Please select valid No of years':null;
                 },
                 hint:  Text(
                   calController.noOfYearsProp.labelText??'-',
                   style: TextStyle(fontSize: 14,color:Color(int.parse(calController.noOfYearsProp.textColor!))),
                 ),
                 // buttonStyleData: ButtonStyleData(
                 //     padding: const EdgeInsets.only(right: 8),
                 //     decoration: BoxDecoration(
                 //       border: Border.all(color: Colors.grey),
                 //       borderRadius: BorderRadius.circular(15),
                 //     )
                 // ),
                 iconStyleData: const IconStyleData(
                   icon: Icon(
                     Icons.arrow_drop_down,
                     color: Colors.black45,
                   ),
                   iconSize: 24,
                 ),
                 dropdownStyleData: DropdownStyleData(
                   maxHeight: 200,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                   ),
                 ),
                 menuItemStyleData: const MenuItemStyleData(
                   padding: EdgeInsets.symmetric(horizontal: 16),
                 ),
               ),

              SizedBox(
                height: size.height * 0.04,
              ),
              InkWell(
                onTap: () {
                  if(_formFieldKey.currentState!.validate() && _formKey.currentState!.validate()){
                    num? result = calController.calculateInterest();
                    if(result!=null) _showMyDialog(context, result,calController.resetCalculator);
                  }
                },
                child: Container(
                  width: size.width /1.5,
                  height: size.height * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors: [Color(0xFFC5EBAA),Color(0xFFA5DD9B)],begin: Alignment.centerLeft,end: Alignment.centerRight)
                  ),
                  child: const Center(child: Text('Calculate',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


Future<void> _showMyDialog(BuildContext context,num result,Function onReset) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Calculation Result',style: TextStyle(),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Interest : ${result.toString()}',style:const TextStyle(fontSize: 21),),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Done'),
            onPressed: () {
              onReset();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}