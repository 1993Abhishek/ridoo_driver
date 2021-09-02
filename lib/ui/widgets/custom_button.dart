import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle textStyle;
  final double height;
  final double width;
  final Color buttonColor;
  final double buttonRadius;
  final Function onClick;
  final double elevation;
  final Color borderSideColor;
  final Color buttonTextColor;

  const CustomButton(
      {@required this.buttonText,
      this.buttonTextColor,
      this.buttonColor,
      @required this.onClick,
      this.textStyle,
      this.height,
      this.width,
      this.elevation = 3,
      this.borderSideColor,
      this.buttonRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: hDimen(50),
        width: width == null ? double.infinity : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: buttonColor != null ? buttonColor : AppColor.colorButton,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color:buttonTextColor!=null? buttonTextColor: Colors.white,
                fontSize: hDimen(16),
                fontWeight: buttonTextColor!=null? FontWeight.bold :FontWeight.normal,
                fontFamily: 'Questrial'),
          ),
        ),
      ),
    );
  }
}
