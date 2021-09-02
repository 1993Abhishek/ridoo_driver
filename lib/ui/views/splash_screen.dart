import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';


class SplashSCreen extends StatefulWidget {
  const SplashSCreen({Key key}) : super(key: key);

  @override
  _SplashSCreenState createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: hDimen(70),
            width: hDimen(200),
            child: Image.asset(
              'assets/ridooLogoNew.png',
              fit: BoxFit.contain,
            ),
          ),
          vSpacing(hDimen(80)),
          Container(
            height: hDimen(300),
            width: double.infinity,
            child: Image.asset(
              'assets/R1.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      )
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        RidooRouter.ROUTE_USER_SELECTION,
      );
    });
    super.initState();
  }
}
