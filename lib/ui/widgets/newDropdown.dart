
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_spacing.dart';

class SurveyDropDownWidget extends StatefulWidget {
  // final String labelText;
  String dropdownValue;
  final List<String> lists;
  final Function selectedValue;
  final bool fromFIndDoctors;
  final Widget prefixWidget;
  final Widget suffixWidget;

  SurveyDropDownWidget({
    this.prefixWidget,
    this.suffixWidget,
    this.fromFIndDoctors,
    this.dropdownValue,
    // this.labelText,
    this.selectedValue,
    this.lists,
  });

  @override
  _SurveyDropDownWidgetState createState() => _SurveyDropDownWidgetState();
}

class _SurveyDropDownWidgetState extends State<SurveyDropDownWidget> {
  bool selectedField = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColor.colorPrimary,
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        left: hDimen(10),
        right: hDimen(5),
      ),
      height: hDimen(45),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          widget.prefixWidget,
          AppSpacing.horizontalSpace(hDimen(15)),
          Expanded(
            child: DropdownButton<String>(
              value: widget.dropdownValue,
              elevation: 16,
              iconSize: 0,
              style: TextStyle(
                color: Colors.black,
                fontSize: hDimen(15),
              ),
              dropdownColor: Colors.white,
              isExpanded: false,
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  widget.dropdownValue = newValue;
                  widget.selectedValue(newValue);
                });
              },
              items: widget.lists
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                  color: Colors.black54,
                  fontSize: hDimen(16),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
            size: hDimen(50),
          ),
        ],
      ),
    );
  }
}
