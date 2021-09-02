import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/size_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Ridoo(),
    );
  }
}
class Ridoo extends StatefulWidget {
  const Ridoo({Key key}) : super(key: key);

  @override
  _RidooState createState() => _RidooState();
}

class _RidooState extends State<Ridoo> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ridoo',
      theme: ThemeData(
        fontFamily: 'Questrial',
        primaryColor: AppColor.colorPrimary,
        accentColor: AppColor.colorPrimary,
      ),
      initialRoute: RidooRouter.ROUTE_INITIAL,
      onGenerateRoute: RidooRouter.generateRoute,
    );
  }
}
