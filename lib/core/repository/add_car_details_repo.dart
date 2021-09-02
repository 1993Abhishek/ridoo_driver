import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ridoo_driver/core/helper/Ridoo_urls.dart';

class AddVehicleRepo
{
  Dio dio = Dio();
  Future<dynamic> addVehicleDetails({dynamic data}) async {
    try {
      Response respose = await dio.post(
        RidOOUrls.baseUrl+RidOOUrls.add_car_details,
        data: data,
      );
      if (respose.statusCode == 200) {
        print("Repo: ${respose.data}");
        return respose;
      } else {
        throw new Exception("Error while fetching data");
      }
    } catch (e) {
      print(e);
      print("**********Not logged in...*********");
    }
  }
}