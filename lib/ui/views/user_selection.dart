import 'package:flutter/material.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({Key key}) : super(key: key);

  @override
  _UserSelectionState createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          vSpacing(hDimen(25)),
          Container(
            height: hDimen(70),
            width: hDimen(200),
            child: Image.asset(
              'assets/ridooLogoNew.png',
              fit: BoxFit.contain,
            ),
          ),
          vSpacing(hDimen(40)),
          Container(
            height: hDimen(300),
            width: double.infinity,
            child: Image.asset(
              'assets/R1.png',
              fit: BoxFit.contain,
            ),
          ),
          vSpacing(hDimen(30)),
          CustomButton(
            buttonText: "Login",
            onClick: () {},
            width: hDimen(250),
          ),
          vSpacing(hDimen(20)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RidooRouter.ROUTE_REGISTER);
            },
            child: Container(
              height: hDimen(50),
              width: hDimen(250),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.colorButtonBorder,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // vSpacing(hDimen(30)),
        ],
      ),
    );
  }
}
