import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:ridoo_driver/core/managers/shared_preference_service.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/widgets/customContainer.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';
import 'package:ridoo_driver/ui/widgets/custom_drawer.dart';

class StartApplication extends StatefulWidget {
  final String userName;

  const StartApplication({
    Key key,
    this.userName = '',
  }) : super(key: key);

  @override
  _StartApplicationState createState() => _StartApplicationState();
}

class _StartApplicationState extends State<StartApplication> {
  // String userName=" John Doe!";
  // void getUserName() async{
  //   String name;
  //   name= await SharedPreference.getStringPreference('name');
  //   setState(() {
  //     userName=name;
  //   });
  // }
  @override
  void initState() {
    // getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              child: Icon(
                Typicons.menu,
                color: Colors.black,
                size: hDimen(20),
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: hDimen(40),
          right: hDimen(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: hDimen(80),
                width: hDimen(100),
                child: Image.asset(
                  'assets/ridoo logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            vSpacing(hDimen(20)),
            Container(
              height: hDimen(70),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: hDimen(20)),
                  child: Text(
                    "Welcome " + widget.userName,
                    style: TextStyle(
                      fontSize: hDimen(18),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            vSpacing(hDimen(20)),
            GestureDetector(
              child: CustomContainer(
                actionName: "Start Application",
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RidooRouter.ROUTE_DOCUMENT_VERIFICATION);
              },
            ),
            vSpacing(hDimen(20)),
            Text(
              "Settings",
              style: TextStyle(
                fontSize: hDimen(12),
                color: Colors.black,
              ),
            ),
            vSpacing(hDimen(10)),
            Container(
              height: hDimen(50),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: hDimen(20),
                  right: hDimen(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesome5.user_circle,
                      color: Colors.black,
                      size: hDimen(25),
                    ),
                    Spacer(),
                    Text(
                      "Profile Settings",
                      style: TextStyle(
                        fontSize: hDimen(16),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black,
                      size: hDimen(25),
                    )
                  ],
                ),
              ),
            ),
            vSpacing(hDimen(60)),
            CustomButton(buttonText: "Clear & Reset", onClick: () {}),
          ],
        ),
      ),
    );
  }
}
