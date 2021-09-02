import 'package:flutter/material.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_spacing.dart';



class ProgressDialog {
  BuildContext context;
  final bool showLogs;
  String dialogMessage;
  BuildContext _dismissingContext;
  bool _isShowing = false;
  bool _barrierDismissible = false;

  ProgressDialog(
      {@required this.context,
      this.showLogs = false,
      this.dialogMessage = "Loading..."});

  bool isShowing() {
    return _isShowing;
  }

  void setDialog({
    BuildContext context,
    String dialogMessage,
  }) {
    this.dialogMessage = dialogMessage;
    this.context = context;
  }

  void dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop();
          if (showLogs) debugPrint('ProgressDialog dismissed');
        } else {
          if (showLogs) debugPrint('Cant pop ProgressDialog');
        }
      } catch (_) {}
    } else {
      if (showLogs) debugPrint('ProgressDialog already dismissed');
    }
  }

  void dismissProgress(BuildContext context) {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
          if (showLogs) debugPrint('ProgressDialog dismissed');
        } else {
          if (showLogs) debugPrint('Cant pop ProgressDialog');
        }
      } catch (_) {}
    } else {
      if (showLogs) debugPrint('ProgressDialog already dismissed');
    }
  }

  Future<bool> hide() {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop(true);
        if (showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } catch (_) {
        return Future.value(false);
      }
    } else {
      if (showLogs) debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  void show() {
    if (!_isShowing) {
      Widget _dialog = _ProgressBody(
        dialogMessage: dialogMessage,
      );
      _isShowing = true;
      if (showLogs) debugPrint('ProgressDialog shown');
      showDialog<dynamic>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _dismissingContext = context;
          return WillPopScope(
            onWillPop: () {
              return Future.value(_barrierDismissible);
            },
            child: Dialog(
                backgroundColor: Colors.white,
                insetAnimationCurve: Curves.bounceOut,
                insetAnimationDuration: Duration(milliseconds: 100),
                elevation: hDimen(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      hDimen(8),
                    ),
                  ),
                ),
                child: _dialog),
          );
        },
      );
    } else {
      if (showLogs) debugPrint("ProgressDialog already shown/showing");
    }
  }
}

class _ProgressBody extends StatefulWidget {
  final String dialogMessage;

  _ProgressBody({@required this.dialogMessage});

  @override
  _ProgressBodyState createState() => _ProgressBodyState();
}

class _ProgressBodyState extends State<_ProgressBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: hDimen(300),
      height: vDimen(80),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(
          hDimen(5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: hDimen(20),
          right: hDimen(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircularProgressIndicator(),
            AppSpacing.horizontalSpace(hDimen(20)),
            Text(
              widget.dialogMessage,
              style: TextStyle(
                  fontSize: hDimen(14), color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
