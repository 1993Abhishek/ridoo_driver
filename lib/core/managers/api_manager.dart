import 'package:flutter/material.dart';
import 'package:ridoo_driver/core/models/car_list_model.dart';
import 'package:ridoo_driver/core/models/user_model.dart';
import 'package:ridoo_driver/core/models/upload_doc_model.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';


class APIDataManager {

  static UserData generateUser({@required dynamic user}) {
    debugPrint("user==>$user");

    UserData userData =UserData(
      referalCode: user["referalCode"],
      email: user["email"],
      city: user["city"],
      name: user["name"],
      countryCode: user["countryCode"],
      createdAt: user["createdAt"],
      // documents: user["documents"],
      phone: user["phone"],
      sId: user["_id"],
      updatedAt: user["updatedAt"],
    );
    print("User Data:$userData");
    return userData;
  }

  static List<DocumentsData> generateDocuments({dynamic docDetails})
  {
    List<DocumentsData> documents=[];
    for(var i=0;i<docDetails.length;i++)
      {
        DocumentsData docData=DocumentsData(
          sId: docDetails[i]['_id'],
          name: docDetails[i]['name'],
          filename: docDetails[i]['filename'],
          updatedAt: docDetails[i]['updatedAt'],
          createdAt: docDetails[i]['createdAt'],
          verifyStatus: docDetails[i]['verifyStatus'],
        );
        documents.add(docData);
      }
    return documents;
  }

  static List<CarData> generateCarList({@required dynamic carList})
  {
    List<CarData> carLists=[];
    for(var i=0;i<carList.length;i++)
      {
        CarData carData=CarData(
          name: carList[i]['name'],
          sId: carList[i]['_id'],
          image: carList[i]['image'],
        );
        carLists.add(carData);
      }
    return carLists;
  }

}



