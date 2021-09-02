import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:ridoo_driver/core/managers/shared_preference_service.dart';
import 'package:ridoo_driver/core/repository/list_vehicle_repo.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';

class ListYourVehicle extends StatefulWidget {
  const ListYourVehicle({Key key}) : super(key: key);

  @override
  _ListYourVehicleState createState() => _ListYourVehicleState();
}

class _ListYourVehicleState extends State<ListYourVehicle> {
  List<bool> selecteds = List.filled(5, false);

  String userId,name;
  ListVehicleRepo listVehicleRepo=ListVehicleRepo();
  bool isGettingData=false;

  fetchVehicleList()async
  {
    if(userId!=null)
      {
        setState(() {
          isGettingData=true;
        });
        Response response= await listVehicleRepo.fetchCarList(data: {
          'userId':userId,
        });
        setState(() {
          isGettingData=true;
        });
      }

  }
  @override
  void initState() {
    initGetData();
    super.initState();
  }

  void initGetData() async
  {
    userId = await SharedPreference.getStringPreference("userId");
    name = await SharedPreference.getStringPreference('name');
    print("User Id:$userId");
  }

  Widget circularImage({String imgPath}) {
    return Container(
      height: hDimen(60),
      width: hDimen(60),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.asset(
            "assets/suv.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget carContainer(
      {String imgPath,
      String carName,
      String carNo,
      bool isSelected,
      Function onTap}) {
    return Container(
      padding: EdgeInsets.only(left: hDimen(15)),
      height: hDimen(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(hDimen(5)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            spreadRadius: 4,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          circularImage(
            imgPath: imgPath,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                carName,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: hDimen(18),
                ),
              ),
              vSpacing(hDimen(10)),
              Text(
                "Car Number: $carNo",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: hDimen(14),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: Container(
              width: hDimen(100),
              child: Image.asset(
                isSelected ? 'assets/Toggle 2.png' : 'assets/Toggle button.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpacing(hDimen(20)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: hDimen(15)),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: hDimen(22),
              ),
            ),
          ),
          Center(
            child: Container(
              height: hDimen(60),
              width: hDimen(160),
              child: Image.asset(
                'assets/ridooLogoNew.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          vSpacing(hDimen(20)),
          Container(
            height: hDimen(80),
            color: Colors.white,
            padding: EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "List your vehicle",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(18),
                      ),
                    ),
                    Icon(
                      LineariconsFree.car,
                      color: Colors.black,
                      size: hDimen(30),
                    ),
                  ],
                ),
                vSpacing(hDimen(10)),
                Text(
                  "Please choose your vehicle",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: hDimen(10),
                  ),
                ),
              ],
            ),
          ),
          vSpacing(hDimen(30)),
          Padding(
            padding: EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Vehicles",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(16),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                      size: hDimen(16),
                    ),
                    Text(
                      "Add more cars",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: hDimen(15)),
                    child: carContainer(
                        imgPath: "",
                        isSelected: selecteds[index],
                        carName: "Hundai Excent",
                        carNo: "2458",
                        onTap: () {
                          print("Selected");
                          setState(() {
                            selecteds[index] = !selecteds[index];
                          });
                        }),
                  );
                },
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                padding: EdgeInsets.only(
                  left: hDimen(20),
                  right: hDimen(20),
                ),
                scrollDirection: Axis.vertical,
              ),
            ),
          )
        ],
      ),
    );
  }
}
