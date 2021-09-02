import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';

typedef OnTextChangeValidator<String> = bool Function(String value);
class OtpTextField extends StatefulWidget {
  final String hintText;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final int maxLength;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Widget suffixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onTap;
  final Color selectedColor;
  final Color unSelectedColor;
  final Function onSubmitted;
  final TextStyle hintTextStyle;

  // final String readOnlyValue;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatter;
  final TextStyle textStyle;
  final TextStyle labelTextStyle;
  final double gapBetween;
  final EdgeInsetsGeometry contentPadding;
  final Function onChange;
  final double elevation;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final Widget prefixWidget;

  const OtpTextField({
    this.hintTextStyle,
    this.prefixWidget,
    this.textAlignVertical,
    this.textAlign,
    this.expands = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.hintText = "",
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.onTap,
    this.selectedColor,
    this.unSelectedColor,
    this.onSubmitted,
    // this.readOnlyValue = "",
    this.obscureText = false,
    this.inputFormatter,
    this.textStyle,
    this.labelTextStyle,
    this.gapBetween,
    this.minLines,
    this.contentPadding,
    this.onChange,
    this.elevation = 1,
    Key key,
  }) : super(key: key);

  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  bool textChangeValidationSuccess = false;
  Widget checkWidget = Icon(
    Icons.check,
    color: Colors.black,
    size: hDimen(18),
  );
  final TextStyle textStyle = TextStyle(
    fontFamily: "Roboto",
    color: Colors.black54,
    fontSize: hDimen(16),
  );
  final TextStyle hintTextStyle = TextStyle(
    color: Colors.black54,
    fontSize: hDimen(15),
  );
  final OutlineInputBorder normalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(hDimen(8)),
    borderSide: BorderSide(
      color: Colors.white60,
      width: 0.8,
    ),
  );
  String dropdownValue = '+91';
  final OutlineInputBorder transparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(hDimen(8)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
  );

  final OutlineInputBorder selectedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(hDimen(8)),
    borderSide: BorderSide(
      color: Colors.white70,
      width: 1.2,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hDimen(50),
      width: hDimen(50),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(hDimen(5)),
      ),
      child: TextFormField(
        textAlignVertical: widget.textAlignVertical,
        expands: widget.expands,
        scrollPhysics: BouncingScrollPhysics(),
        scrollPadding: EdgeInsets.all(0),
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        enableSuggestions: false,
        focusNode: widget.focusNode,
        controller: widget.controller,
        inputFormatters: widget.inputFormatter,
        onTap: () {
          if (widget.onTap != null) widget.onTap();
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted(value);
          }
        },
        obscureText: widget.obscureText,
        maxLength: 1,
        cursorColor: Colors.black,
        minLines: widget.minLines,
        keyboardType: widget.inputType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        textAlign:
        widget.textAlign == null ? TextAlign.start : widget.textAlign,
        onChanged: (value) {
          if (widget.onChange != null) widget.onChange(value);
        },
        decoration: InputDecoration(
          counterText: "",
          hintText: widget.hintText,
          hintStyle: widget.hintTextStyle == null
              ? hintTextStyle
              : widget.hintTextStyle,
          enabledBorder: transparentBorder,
          focusedBorder: selectedBorder,
          border: transparentBorder,
        ),
        style: widget.textStyle != null ? widget.textStyle : textStyle,
      ),
    );
  }
}
