import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:ridoo_driver/core/helper/Ridoo_urls.dart';
import 'package:ridoo_driver/core/managers/api_manager.dart';
import 'package:ridoo_driver/core/models/car_list_model.dart';
import 'package:ridoo_driver/core/repository/car_list_repo.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key key}) : super(key: key);

  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  bool isGettingData = false;
  CarListRepo _carListRepo = CarListRepo();

  @override
  void initState() {
    fetchCarList();
    super.initState();
  }

  List<CarData> _carDataList = [];

  fetchCarList() async {
    setState(() {
      isGettingData = true;
    });
    Response response = await _carListRepo.fetchCarList();
    mPrintln(response.data);
    mPrintln(response.data['status']);
    mPrintln(response.data['data']);
    if (response.data['status'] == 'success') {
      _carDataList =
          APIDataManager.generateCarList(carList: response.data['data']);
      print('Cardata List:$_carDataList');
    }
    setState(() {
      isGettingData = false;
    });
  }

  Widget carContainer({
    String imgPath,
    String carType,
    Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hDimen(140),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(hDimen(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              spreadRadius: 4,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                hSpacing(hDimen(10)),
                Container(
                  height: hDimen(80),
                  width: hDimen(160),
                  child: Image.network(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                hSpacing(hDimen(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carType,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(18),
                      ),
                    ),
                    vSpacing(hDimen(10)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Select this car type",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: hDimen(10),
                          ),
                        ),
                        hSpacing(hDimen(10)),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: hDimen(10),
                        ),
                      ],
                    ),
                  ],
                ),
                hSpacing(hDimen(20)),
              ],
            ),
            vSpacing(hDimen(20)),
            Padding(
              padding: EdgeInsets.only(right: hDimen(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_outlined,
                    color: Colors.yellow[900],
                    size: hDimen(20),
                  ),
                  Icon(
                    Icons.star_outlined,
                    color: Colors.yellow[900],
                    size: hDimen(20),
                  ),
                  Icon(
                    Icons.star_outlined,
                    color: Colors.yellow[900],
                    size: hDimen(20),
                  ),
                  Icon(
                    Icons.star_outlined,
                    color: Colors.yellow[900],
                    size: hDimen(20),
                  ),
                  Icon(
                    Icons.star_half_rounded,
                    color: Colors.yellow[900],
                    size: hDimen(20),
                  ),
                  Text(
                    " 4.5 (2.4k)",
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: hDimen(16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: isGettingData
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                backgroundColor: AppColor.colorButton,
              ),
            )
          : Column(
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
                    height: hDimen(100),
                    width: hDimen(180),
                    child: Image.asset(
                      'assets/ridoo logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                            "Add your vehicle to continue",
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
                        "Please enter the required details",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: hDimen(10),
                        ),
                      ),
                    ],
                  ),
                ),
                vSpacing(hDimen(60)),
                Padding(
                  padding: EdgeInsets.only(
                    left: hDimen(15),
                    right: hDimen(15),
                  ),
                  child: Text(
                    "Select vehicle type",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: hDimen(16),
                    ),
                  ),
                ),
                vSpacing(hDimen(20)),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom:hDimen(20)),
                          child: carContainer(
                              imgPath: RidOOUrls.baseUrl+RidOOUrls.imageBaseUrl+_carDataList[index].image,
                              carType: _carDataList[index].name,
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RidooRouter.ADD_VEHICLE_DETAILS,arguments:_carDataList[index].sId, );
                              }),
                        );
                      },
                      itemCount: _carDataList.length,
                      padding: EdgeInsets.only(
                        left: hDimen(15),
                        right: hDimen(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
