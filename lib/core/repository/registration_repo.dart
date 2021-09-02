import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ridoo_driver/core/helper/Ridoo_urls.dart';
import 'package:ridoo_driver/ui/helper/static_widget_helper.dart';

class RegistrationRepo
{
  Dio dio = Dio();
  Future<dynamic> fetchUserDetailsLogin({dynamic data}) async {
    print("***********Data: ${/*jsonEncode(data)*/data}***************8");
    try {
      Response respose = await dio.post(
        RidOOUrls.baseUrl+RidOOUrls.signUp,
        data: jsonEncode(data),
        // queryParameters: data,
      );
      print("Repo: ${respose}");
      if (respose.statusCode == 200) {
        print("Repo: ${respose.data['data']}");
        return respose.data["data"];
      } else {
        WidgetHelper.showToastMessage(respose.data['error']);
        throw new Exception("Error while fetching data");
      }
    } catch (e) {
      print(e);
      print("**********Not logged in...*********");
    }
  }
}