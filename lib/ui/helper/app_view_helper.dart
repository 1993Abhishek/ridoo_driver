import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ridoo_driver/ui/dialogues/action_alert_dialog.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_strings.dart';


import 'app_colors.dart';

void mPrint(Object object, {String tag = "", bool printOn = true}) {
  if (!printOn) return;
  debugPrint("[$tag] :: $object");
}

void mPrintln(Object object, {String tag, bool printOn = true}) {
  if (!printOn) return;
  debugPrint("\n[$tag] :: $object\n");
}

Widget vSpacing(double dimen) {
  return Container(
    height: dimen,
    width: 0,
  );
}

Widget hSpacing(double dimen) {
  return Container(
    height: 0,
    width: dimen,
  );
}

showNoInternetFlushbar(BuildContext context) {
  Flushbar(
    message: AppStrings.noInternetConnection,
    icon: Icon(
      Icons.perm_scan_wifi,
      color: Colors.grey[300],
    ),
    duration: Duration(seconds: 5),
  )..show(context);
}

showToast({@required String message}) {
  Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
}

showFlushbarAction(
    {@required BuildContext context,
      @required String actionText,
      @required String message,
      @required Function onAction}) {
  Flushbar(
    message: message,
    mainButton: FlatButton(
        onPressed: () => onAction(),
        child: Text(
          actionText,
          style: TextStyle(color: Colors.amber),
        )),
    icon: Icon(
      Icons.info,
      color: Colors.grey[300],
    ),
    duration: Duration(seconds: 5),
  )..show(context);
}

showFlushbar(
    {@required BuildContext context,
      @required String message,
      IconData iconData}) {
  Flushbar(
    message: message,
    icon: Icon(
      iconData != null ? iconData : Icons.error,
      color: Colors.red,
    ),
    duration: Duration(seconds: 8),
  )..show(context);
}

Flushbar showProgressFlashBar({
  @required String message,
}) {
  return Flushbar(
    message: message,
    icon: Icon(
      Icons.file_upload,
      color: Colors.green,
    ),
    isDismissible: false,
  );
}

showFailureFlushbar({
  @required BuildContext context,
  @required String message,
}) {
  Flushbar(
    message: message,
    icon: Icon(
      Icons.cancel,
      color: Colors.red,
    ),
    duration: Duration(seconds: 5),
  )..show(context);
}

showSuccessFlushbar({
  @required BuildContext context,
  @required String message,
}) {
  Flushbar(
    message: message,
    icon: Icon(
      Icons.check_circle,
      color: Colors.green,
    ),
    duration: Duration(seconds: 5),
  )..show(context);
}


Future<DateTime> openDatePicker(BuildContext context,
    {DateTime initialDate, DateTime firstDate, DateTime lastDate}) async {
  DateTime current = DateTime.now();
  final DateTime pickedDateTime = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.colorPrimary,
            accentColor: AppColor.colorPrimary,
            colorScheme: ColorScheme.light(primary: AppColor.colorPrimary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      initialDate: initialDate != null ? initialDate : DateTime.now(),
      firstDate:
      firstDate != null ? firstDate : DateTime(current.year - 100, 1),
      lastDate: lastDate != null ? lastDate : DateTime(current.year + 100, 1));
  return pickedDateTime;
}

Future<T> showMyDialog<T>(
    {@required BuildContext context, @required Widget dialogChild}) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutSine.transform(a1.value) - 1.0;

        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: dialogChild,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 600),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}

void showErrorDialog(
    {@required BuildContext context,
      @required String description,
      String title,
      String actionText,
      IconData errorIcon,
      Function onActionClick}) {
  showMyDialog(
      context: context,
      dialogChild: ActionAlertDialog(
        title: title != null ? title : "",
        //backgroundColor: AppColor.colorBackgroundLightRed,
        message: description,
        isMultiAction: false,
        topIcon: errorIcon != null ? errorIcon : Icons.error,
        actionColor: Colors.red,
        actionText: actionText != null ? actionText : "Try Again",
        topIconColor: Colors.white,
        onActionClick: () {
          if (onActionClick != null)
            onActionClick();
          else
            Navigator.pop(context);
        },
      ));
}

void showSuccessDialog(
    {@required BuildContext context,
      @required String description,
      String title,
      IconData successIcon,
      String actionText,
      Function onActionClick}) {
  showMyDialog(
      context: context,
      dialogChild: ActionAlertDialog(
        title: title != null ? title : "Success!",
        // backgroundColor: AppColor.colorBackgroundLightGreen,
        message: description,
        isMultiAction: false,
        topIcon: successIcon != null ? successIcon : Icons.check_circle,
        actionColor: AppColor.colorPrimary,
        actionText: actionText != null ? actionText : "OK",
        topIconColor: Colors.white,
        onActionClick: () {
          if (onActionClick != null)
            onActionClick();
          else
            Navigator.pop(context);
        },
      ));
}

showInfoDialog(
    BuildContext context, String title, String info, Function onTap) {
  return showMyDialog(
      context: context,
      dialogChild: AlertDialog(
        title: Text("$title",
            style: TextStyle(color: Colors.black87, fontSize: hDimen(20))),
        content: Text(
          "$info",
          style: TextStyle(color: Colors.black87, fontSize: hDimen(16)),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                onTap();
              },
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.deepOrange),
              )),
        ],
      ));
}

