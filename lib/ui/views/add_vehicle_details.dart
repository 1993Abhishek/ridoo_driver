import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:ridoo_driver/core/managers/api_manager.dart';
import 'package:ridoo_driver/core/managers/shared_preference_service.dart';
import 'package:ridoo_driver/core/models/upload_doc_model.dart';
import 'package:ridoo_driver/core/repository/add_car_details_repo.dart';
import 'package:ridoo_driver/core/repository/upload_file_repo.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/dialogues/image_picker_dialog.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/helper/static_widget_helper.dart';
import 'package:ridoo_driver/ui/widgets/customContainer.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';
import 'package:ridoo_driver/ui/widgets/textfield_widget.dart';

class AddVehicleDetails extends StatefulWidget {
  final String categoryId;

  const AddVehicleDetails({
    Key key,
    this.categoryId,
  }) : super(key: key);

  @override
  _AddVehicleDetailsState createState() => _AddVehicleDetailsState();
}

class _AddVehicleDetailsState extends State<AddVehicleDetails> {
  bool isImagePickerNeeded = false;
  TextEditingController vehicleNumber = TextEditingController(),
      carModelName = TextEditingController();
  FocusNode vehicleNode, carModeNode = FocusNode();
  AddVehicleRepo addVehicleDetails = AddVehicleRepo();
  Response response;
  List<DocumentsData> documents = [];
  String profilePhoto = '';
  String vehiclePhoto = '';
  String vehicleInsurance = '';
  String vehicleRc = '';
  String permit = '';
  String fitnessCert = '';

  bool isProfilePic = false;
  bool isVehiclePic = false;
  bool isVehicleIns = false;
  bool isVehicleRc = false;
  bool isPermit = false;
  bool isFitness = false;

  bool isGettingData = false;

  String userId,name;
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

  Future<String> uploadImage() async {
    if (name != null && userId != null&&userId.isNotEmpty&&name.isNotEmpty) {
      setState(() {
        isGettingData = true;
      });
      Map<String, dynamic> data = {
        'categoryId': widget.categoryId,
        'userId': userId,
        'vehicleNo': vehicleNumber.text,
        'carModel': carModelName.text,
      };
      data.addAll({
        'profileImage': await MultipartFile.fromFile(
          profilePhoto,
          filename: 'profile',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      data.addAll({
        'carImage': await MultipartFile.fromFile(
          vehiclePhoto,
          filename: 'vehicle',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      data.addAll({
        'insuranceDoc': await MultipartFile.fromFile(
          vehicleInsurance,
          filename: 'insurence',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      data.addAll({
        'rcDoc': await MultipartFile.fromFile(
          vehicleRc,
          filename: 'RC',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      data.addAll({
        'permitDoc': await MultipartFile.fromFile(
          permit,
          filename: 'permit',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      data.addAll({
        'fitnessDoc': await MultipartFile.fromFile(
          fitnessCert,
          filename: 'fitness',
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      print("Data:$data");
      FormData formData = FormData.fromMap(data);
      print('Form data:${formData}');

      response = await addVehicleDetails.addVehicleDetails(
        data: formData,
      );
      print("Response:${response.data['data']}");
      WidgetHelper.showToastMessage(response.data['status']);
      setState(() {
        isGettingData = false;
      });
      if (response.data['data'] != null) {
        Navigator.of(context).pushNamed(RidooRouter.LIST_VEHICLE);
      }
      // documents = APIDataManager.generateDocuments(
      //     docDetails: response.data['data']['documents']);
    }
    print(documents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: isImagePickerNeeded
          ? Center(
              child: ImagePickerDialog(
                onImageTaken: (imgPath) {
                  if (imgPath != null) {
                    // uploadImage(imgPath);

                    if (isFitness) {
                      fitnessCert = imgPath;
                      mPrintln("Fitness CertI Pic: $imgPath");
                    }
                    if (isPermit) {
                      permit = imgPath;
                      mPrintln("permit Pic: $imgPath");
                    }
                    if (isProfilePic) {
                      profilePhoto = imgPath;
                      mPrintln("Profile Pic: $imgPath");
                    }
                    if (isVehicleIns) {
                      vehicleInsurance = imgPath;
                      mPrintln("vehicleInsurance Pic: $imgPath");
                    }
                    if (isVehiclePic) {
                      vehiclePhoto = imgPath;
                      mPrintln("vehiclePhoto Pic: $imgPath");
                    }
                    if (isVehicleRc) {
                      vehicleRc = imgPath;
                      mPrintln("vehicleRc Pic: $imgPath");
                    }

                    setState(() {
                      isImagePickerNeeded = false;
                    });
                  } else {
                    WidgetHelper.showToastMessage('Image does not save');
                  }
                },
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
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
                      width: hDimen(180),
                      child: Image.asset(
                        'assets/ridooLogoNew.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  Container(
                    height: hDimen(50),
                    color: Colors.white,
                    padding: EdgeInsets.only(
                      left: hDimen(20),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Here's what you need to do to add your cars",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: hDimen(14),
                        ),
                      ),
                    ),
                  ),
                  vSpacing(hDimen(20)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: hDimen(15),
                      right: hDimen(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recomended steps",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hDimen(14),
                          ),
                        ),
                        vSpacing(hDimen(20)),
                        GestureDetector(
                          onTap: () {
                            print("ProfilePic tap");
                            setState(() {
                              isProfilePic = true;
                              isVehiclePic = false;
                              isVehicleIns = false;
                              isVehicleRc = false;
                              isPermit = false;
                              isFitness = false;
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
                              isProfilePic = false;
                              isVehiclePic = true;
                              isVehicleIns = false;
                              isVehicleRc = false;
                              isPermit = false;
                              isFitness = false;
                              isImagePickerNeeded = true;
                            });
                          },
                          child: CustomContainer(
                            actionName: "Vehicle Photo",
                          ),
                        ),
                        vSpacing(hDimen(20)),
                        TextFieldWidget(
                          controller: carModelName,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.text,
                          hintText: "Car Model Name",
                          focusNode: carModeNode,
                          onSubmitted: (value) {
                            carModeNode.unfocus();
                            vehicleNode.requestFocus();
                          },
                        ),
                        vSpacing(hDimen(20)),
                        TextFieldWidget(
                          inputType: TextInputType.text,
                          controller: vehicleNumber,
                          hintText: "Vehicle Number",
                          focusNode: vehicleNode,
                          onSubmitted: (value) {
                            vehicleNumber.text = value;
                            vehicleNode.unfocus();
                          },
                          onChange: (value) {
                            // remindMe.text = value;
                          },
                        ),
                        vSpacing(hDimen(20)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isProfilePic = false;
                              isVehiclePic = false;
                              isVehicleIns = true;
                              isVehicleRc = false;
                              isPermit = false;
                              isFitness = false;
                              isImagePickerNeeded = true;
                            });
                          },
                          child: CustomContainer(
                            actionName: "Vehicle Insurance",
                          ),
                        ),
                        vSpacing(hDimen(20)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isProfilePic = false;
                              isVehiclePic = false;
                              isVehicleIns = false;
                              isVehicleRc = true;
                              isPermit = false;
                              isFitness = false;
                              isImagePickerNeeded = true;
                            });
                          },
                          child: CustomContainer(
                            actionName: "Vehicle RC",
                          ),
                        ),
                        vSpacing(hDimen(20)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isProfilePic = false;
                              isVehiclePic = false;
                              isVehicleIns = false;
                              isVehicleRc = false;
                              isPermit = true;
                              isFitness = false;
                              isImagePickerNeeded = true;
                            });
                          },
                          child: CustomContainer(
                            actionName: "Permit",
                          ),
                        ),
                        vSpacing(hDimen(20)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isProfilePic = false;
                              isVehiclePic = false;
                              isVehicleIns = false;
                              isVehicleRc = false;
                              isPermit = false;
                              isFitness = true;
                              isImagePickerNeeded = true;
                            });
                          },
                          child: CustomContainer(
                            actionName: "Fitness Certificate",
                          ),
                        ),
                        vSpacing(hDimen(20)),
                        isGettingData
                            ? Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: AppColor.colorButton,
                                  strokeWidth: 1,
                                ),
                              )
                            : CustomButton(
                                buttonText: "SUBMIT TO CONTINUE",
                                onClick: () {
                                  mPrintln('Car Name:${carModelName.text}');
                                  mPrintln('Car NO:${vehicleNumber.text}');
                                  if (profilePhoto.isNotEmpty &&
                                      vehiclePhoto.isNotEmpty &&
                                      vehicleInsurance.isNotEmpty &&
                                      vehicleRc.isNotEmpty &&
                                      permit.isNotEmpty &&
                                      fitnessCert.isNotEmpty &&
                                      carModelName.text != null &&
                                      vehicleNumber.text != null &&
                                      carModelName.text.isNotEmpty &&
                                      vehicleNumber.text.isNotEmpty) {
                                    uploadImage();
                                  } else {
                                    WidgetHelper.showToastMessage(
                                        'Please fill up all the details properly to register your car properly.');
                                  }
                                },
                              ),
                        vSpacing(hDimen(20)),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
