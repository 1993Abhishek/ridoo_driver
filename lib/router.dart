import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridoo_driver/ui/helper/route_animation.dart';
import 'package:ridoo_driver/ui/views/add_vehicle_details.dart';
import 'package:ridoo_driver/ui/views/add_your_vehicle.dart';
import 'package:ridoo_driver/ui/views/document-verification.dart';
import 'package:ridoo_driver/ui/views/list_vehicle.dart';
import 'package:ridoo_driver/ui/views/otp_verification.dart';
import 'package:ridoo_driver/ui/views/register.dart';
import 'package:ridoo_driver/ui/views/register_details.dart';
import 'package:ridoo_driver/ui/views/register_phone.dart';
import 'package:ridoo_driver/ui/views/splash_screen.dart';
import 'package:ridoo_driver/ui/views/start_application_page.dart';
import 'package:ridoo_driver/ui/views/user_selection.dart';

const String initialRoute = "/";

class RidooRouter {
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_USER_SELECTION = "user-selection";
  static const String ROUTE_HOME = "home";
  static const String ROUTE_DASHBOARD = "dashboard";
  static const String ROUTE_WEB_VIEW = "webView";
  static const String ROUTE_LOG_IN = "login";
  static const String ROUTE_REGISTER = "registration";
  static const String ROUTE_REGISTER_PHONE = "register-phone";
  static const String ROUTE_REGISTER_DETAILS = "register-details";
  static const String ROUTE_START_APPLICATION = "start-application";
  static const String ROUTE_DOCUMENT_VERIFICATION = "document-verification";
  static const String ROUTE_OTP_VERIFICATION = "otp-verification";
  static const String ADD_VEHICLE = "add-vehicle";
  static const String LIST_VEHICLE = "list-vehicle";
  static const String ADD_VEHICLE_DETAILS = "add-vehicle-details";

  static String ROUTE_CURRENT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;
    switch (settings.name) {
      case ROUTE_INITIAL:
        currentWidget = SplashSCreen();
        break;
      case ROUTE_USER_SELECTION:
        currentWidget = UserSelection();
        break;
      case ROUTE_REGISTER:
        currentWidget = RegisterScreen();
        break;
      case ROUTE_REGISTER_PHONE:
        currentWidget = RegisterWithPhone();
        break;
      case ROUTE_REGISTER_DETAILS:
        currentWidget = RegisterDetails();
        break;
      case ROUTE_OTP_VERIFICATION:
        currentWidget = OtpVerification(phoneNo: settings.arguments,);
        break;
      case ROUTE_START_APPLICATION:
        currentWidget = StartApplication(userName: settings.arguments,);
        break;
      case ROUTE_DOCUMENT_VERIFICATION:
        currentWidget = DocumentVerification();
        break;
      case ADD_VEHICLE:
        currentWidget = AddVehicle();
        break;
      case LIST_VEHICLE:
        currentWidget = ListYourVehicle();
        break;
      case ADD_VEHICLE_DETAILS:
        currentWidget = AddVehicleDetails(categoryId: settings.arguments,);
        break;
      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return FadeRoute(page: currentWidget, settings: settings);
  }
}
