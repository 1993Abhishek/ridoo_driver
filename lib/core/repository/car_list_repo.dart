import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ridoo_driver/core/helper/Ridoo_urls.dart';

class CarListRepo
{
  Dio dio = Dio();
  Future<dynamic> fetchCarList() async {
    try {
      Response respose = await dio.get(
        RidOOUrls.baseUrl+RidOOUrls.car_listing,
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