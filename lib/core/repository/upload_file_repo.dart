import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ridoo_driver/core/helper/Ridoo_urls.dart';

class UploadFilerepo
{
  Dio dio = Dio();
  Future<dynamic> uploadImage({dynamic data}) async {
    try {
      print("***********Data: ${data}***************8");
      Response respose = await dio.patch(
        RidOOUrls.baseUrl+RidOOUrls.uploadDocs,
        data: data,
      );
      print(respose.statusCode);
      if (respose.statusCode == 200) {
        print("Repo: ${respose}");
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