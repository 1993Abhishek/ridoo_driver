import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:ridoo_driver/core/managers/api_manager.dart';
import 'package:ridoo_driver/core/managers/shared_preference_service.dart';
import 'package:ridoo_driver/core/models/upload_doc_model.dart';
import 'package:ridoo_driver/core/repository/upload_file_repo.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/dialogues/image_picker_dialog.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/helper/static_widget_helper.dart';
import 'package:ridoo_driver/ui/widgets/customContainer.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';

class DocumentVerification extends StatefulWidget {
  const DocumentVerification({Key key}) : super(key: key);

  @override
  _DocumentVerificationState createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  bool isImagePickerNeeded = false;
  UploadFilerepo uploadFilerepo = UploadFilerepo();
  Response response;

  Future<String> uploadImage(String path) async {
    String userId = await SharedPreference.getStringPreference("userId");
    String name = await SharedPreference.getStringPreference('name');
    String fileName = path.split('/').last;
    print("User Id:$userId");

    if (name != null && userId != null && path != null) {
      Map<String, dynamic> data = {
        'name': name,
        'userId': userId,
      };
      data.addAll({
        'document_file': await MultipartFile.fromFile(
          path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      print("Data:$data");
      FormData formData = FormData.fromMap(data);
      print('Form data:${formData}');

      response = await uploadFilerepo.uploadImage(
        data: formData,
      );
      print("Response:${response.data['data']['documents']}");

      List<DocumentsData> documents = APIDataManager.generateDocuments(
          docDetails: response.data['data']['documents']);

    }

    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: isImagePickerNeeded
          ? Center(
              child: ImagePickerDialog(
                onImageTaken: (imgPath) {
                  print("Image Path:$imgPath");
                  if (imgPath != null) {
                    uploadImage(imgPath);
                    setState(() {
                      isImagePickerNeeded = false;
                    });
                  } else {
                    WidgetHelper.showToastMessage('image does not save.');
                  }
                },
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: hDimen(20),
                right: hDimen(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSpacing(hDimen(20)),
                  Padding(
                    padding: EdgeInsets.only(right: hDimen(20)),
                    child: Center(
                      child: Container(
                        height: hDimen(110),
                        width: hDimen(170),
                        child: Image.asset(
                          'assets/ridoo logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: hDimen(50),
                    color: Colors.white,
                    padding: EdgeInsets.only(left: hDimen(10)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Here's what you need to do is to set up your account",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: hDimen(12),
                        ),
                      ),
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  Text(
                    "Recomended Steps",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: hDimen(12),
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Profile Photo",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Aadhar Card (Font)",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Aadhar Card (Back)",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Pan Card",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Driving Licence (Font)",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Driving Licence (Back)",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Legal Aggrement",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Bank Passbook",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  Divider(
                    height: hDimen(2),
                    color: Colors.black,
                  ),
                  vSpacing(hDimen(20)),
                  Text(
                    "Optional Steps",
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: hDimen(12),
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Voter Card",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isImagePickerNeeded = true;
                      });
                    },
                    child: CustomContainer(
                      actionName: "Policy Clearance Certificate",
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  Center(
                    child: CustomButton(
                      buttonText: "Clear & Reset",
                      onClick: () {
                        Navigator.of(context).pushNamed(
                          RidooRouter.ADD_VEHICLE,
                        );
                      },
                      width: hDimen(280),
                      buttonColor: Colors.white,
                      height: hDimen(40),
                      buttonTextColor: Colors.red,
                    ),
                  ),
                  vSpacing(hDimen(30)),
                  CustomButton(
                      buttonText: "SUBMIT TO CONTINUE",
                      onClick: () {
                        Navigator.of(context)
                            .pushNamed(RidooRouter.ADD_VEHICLE);
                      }),
                  vSpacing(hDimen(20)),
                ],
              ),
            ),
    );
  }
}
