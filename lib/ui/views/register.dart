import 'package:flutter/material.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          vSpacing(hDimen(30)),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Icon(
          //     Icons.chevron_left_rounded,
          //     color: Colors.black,
          //     size: hDimen(40),
          //   ),
          // ),
          // vSpacing(hDimen(10)),
          Center(
            child: Container(
              height: hDimen(70),
              // width: hDimen(200),
              child: Image.asset(
                'assets/ridooLogoNew.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          vSpacing(hDimen(40)),
          Container(
            height: hDimen(300),
            width: double.infinity,
            child: Image.asset(
              'assets/R2.png',
              fit: BoxFit.contain,
            ),
          ),
          vSpacing(hDimen(40)),
          Padding(
            padding: EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(20),
            ),
            child: Text(
              "Sign up to begin your journey and\nstart earning",
              style: TextStyle(
                fontSize: hDimen(18),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          vSpacing(hDimen(50)),
          Padding(
            padding: EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(20),
            ),
            child: CustomButton(
              buttonText: "Continue with mobile number",
              onClick: () {
                Navigator.of(context)
                    .pushNamed(RidooRouter.ROUTE_REGISTER_PHONE);
              },
              // width: hDimen(250),
            ),
          ),
          vSpacing(hDimen(30)),
        ],
      ),
    );
  }
}
