import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_spacing.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';


// import 'package:sb_project/ui/widgets/info_dialog_clipper.dart';
// import 'package:sb_project/ui/widgets/oie_services_button.dart';

class ActionAlertDialog extends StatefulWidget {
  final bool barrierDismissible;
  final String title;
  final String message;
  final Function onActionClick;
  final String actionText;
  final Color actionColor;
  final Function onNegativeActionClick;
  final Function onPositiveActionClick;
  final String positiveActionText;
  final String negativeActionText;
  final Color positiveActionColor;
  final Color negativeActionColor;
  final Color backgroundColor;
  final bool isMultiAction;
  final IconData topIcon;
  final Color topIconColor;
  final String actionPositiveText;
  final String actionNegativeText;

  ActionAlertDialog(
      {this.barrierDismissible = false,
      @required this.title,
      @required this.message,
      this.topIcon,
      this.topIconColor,
      this.actionText,
      this.actionColor = Colors.black,
      this.onActionClick,
      this.positiveActionText,
      this.negativeActionText,
      this.onPositiveActionClick,
      this.onNegativeActionClick,
      this.positiveActionColor,
      this.negativeActionColor,
      this.backgroundColor,
      this.isMultiAction = false,
      this.actionPositiveText,
      this.actionNegativeText});

  @override
  _ActionAlertDialogState createState() => _ActionAlertDialogState();
}

class _ActionAlertDialogState extends State<ActionAlertDialog> {
  @override
  Widget build(BuildContext context) {
    Widget dialogContent(BuildContext context) {
      return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(hDimen(15))),
          color: Colors.white,
          child: Container(
            //height: AppDimen.V_DIMEN_350,
            width: vDimen(300),
            child: Column(
              mainAxisSize: MainAxisSize.max, // To make the card compact
              children: <Widget>[
                ClipPath(
                  child: Container(
                    decoration: new BoxDecoration(
                      color: widget.backgroundColor != null
                          ? widget.backgroundColor
                          : AppColor.colorSecondary,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(hDimen(15)),
                    ),
                    height: vDimen(100),
                    child: Center(
                      child:
                          Image.asset("assets/sunetra_round_icon/192x192.png"),
                    ),
                  ),
                  // clipper: InfoDialogClipper(),
                ),
                AppSpacing.verticalSpace(hDimen(5)),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(hDimen(10)),
                  child: Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: hDimen(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: vDimen(10)),
                    child: widget.isMultiAction
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AppSpacing.horizontalSpace(hDimen(20)),
                              CustomButton(
                                buttonText: widget.positiveActionText,
                                onClick: widget.onPositiveActionClick,
                                height: hDimen(40),
                                width: hDimen(100),
                              ),
                              AppSpacing.horizontalSpace(hDimen(20)),
                              CustomButton(
                                buttonText: widget.negativeActionText,
                                onClick: widget.onNegativeActionClick,
                                height: hDimen(40),
                                width: hDimen(100),
                              ),
                            ],
                          )
                        : Container()),
                AppSpacing.verticalSpace(vDimen(30))
              ],
            ),
          ));
    }

    return WillPopScope(
      onWillPop: () => Future.value(widget.barrierDismissible),
      child: Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: dialogContent(context),
        ),
      ),
    );
  }
}
