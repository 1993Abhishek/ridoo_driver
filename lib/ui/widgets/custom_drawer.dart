import 'package:flutter/material.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_spacing.dart';

class CustomDrawer extends StatefulWidget {
  final BuildContext parentContext;

  const CustomDrawer({
    Key key,
    this.parentContext,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget DrawerItem(String itemName) {
    return Text(
      itemName,
      style: TextStyle(
        // fontFamily: ,
        fontSize: hDimen(14),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: hDimen(200),
      color: AppColor.colorButtonBorder,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: hDimen(35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppSpacing.verticalSpace(hDimen(15)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PATIENT SECTION",
                    style: TextStyle(
                      // fontFamily: ,
                      fontSize: hDimen(20),
                      color: Colors.white,
                    ),
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context)
                      //     .pushReplacementNamed(SunetraRouter.ROUTE_HOME);
                    },
                    child: DrawerItem("Home"),
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Online Appointment Request"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_WEB_VIEW,
                      //   arguments: "www.sunetra.org/bookings",
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Appointment History"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_APPOINTMENT_HISTORY,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Find A Doctor"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_FIND_DOCTOR,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Track Progress"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //     SunetraRouter.ROUTE_TRACK_PROGRESS);
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem(
                      "Eye Test",
                    ),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_EYE_TEST,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                ],
              ),
            ),
            Container(
              height: hDimen(2),
              width: double.infinity,
              color: Colors.black12,
            ),
            AppSpacing.verticalSpace(hDimen(25)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "GENERAL INFORMATION",
                    style: TextStyle(
                      // fontFamily: ,
                      fontSize: hDimen(20),
                      color: Colors.white,
                    ),
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_FAQS,
                      // );
                    },
                    child: DrawerItem("Faq's"),
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("News & Events"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_NEWS_EVENTS,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Testimonials"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_TESTIMONIAL,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Contact Sunetra"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_CONTACT_US,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  Container(
                    height: hDimen(2),
                    width: double.infinity,
                    color: Colors.black12,
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Blue Light Filter"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_FILTER,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("20-20-20 Rule"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_TWENTY_RULE,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(25)),
                  GestureDetector(
                    child: DrawerItem("Set Reminder"),
                    onTap: () {
                      // Navigator.of(context).pushReplacementNamed(
                      //   SunetraRouter.ROUTE_REMINDER,
                      // );
                    },
                  ),
                  AppSpacing.verticalSpace(hDimen(20)),
                  Center(
                    child: Text(
                      "Version: 1.8",
                      style: TextStyle(
                        // fontFamily: ,
                        fontSize: hDimen(14),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
