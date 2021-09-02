import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ridoo_driver/core/helper/Ridoo_urls.dart';

class OtpVerificationRepo
{
  Dio dio = Dio();
  Future<dynamic> fetchUserOTP({dynamic data}) async {
    print("***********Data: ${jsonEncode(data)}***************8");
    try {
      Response respose = await dio.post(
        RidOOUrls.baseUrl+RidOOUrls.FBToken,
        data: jsonEncode(data),
        // queryParameters: data,
      );
      if (respose.statusCode == 200) {
        print("Repo: ${respose.data}");
        return respose.data;
      } else {
        throw new Exception("Error while fetching data");
      }
    } catch (e) {
      print(e);
      print("**********Not logged in...*********");
    }
  }
}