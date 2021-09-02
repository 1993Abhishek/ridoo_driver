import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ridoo_driver/core/managers/api_manager.dart';
import 'package:ridoo_driver/core/managers/shared_preference_service.dart';
import 'package:ridoo_driver/core/models/user_model.dart';
import 'package:ridoo_driver/core/repository/registration_repo.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/helper/static_widget_helper.dart';
import 'package:ridoo_driver/ui/widgets/customTextfieldWidget.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';
import 'package:ridoo_driver/ui/widgets/textfieldWithdropdown.dart';

class RegisterDetails extends StatefulWidget {
  const RegisterDetails({Key key}) : super(key: key);

  @override
  _RegisterDetailsState createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      phoneNo = TextEditingController(),
      referelCode = TextEditingController();

  FocusNode nodeName = FocusNode(),
      nodeEmail = FocusNode(),
      nodePhoneNo = FocusNode(),
      nodeReferelCode = FocusNode();

  String dropdownValue = 'Kolkata';
  RegistrationRepo registrationRepo = RegistrationRepo();
  bool isRegistering = false;

  Future registerUser({
    String name,
    String email,
    String phoneNo,
    String countryCode,
    String referalCode,
    String city,
  }) async {
    dynamic data = {
      "name": name,
      "email": email,
      "phone": phoneNo,
      "countryCode": "+91",
      "city": city,
      "referalCode": referalCode,
    };
    setState(() {
      isRegistering = true;
    });
    dynamic response = await registrationRepo.fetchUserDetailsLogin(data: data);
    print(response);
    if (response != null) {
      UserData userData = APIDataManager.generateUser(user: response);
      print('UserName:${userData.name}');
      SharedPreference.saveStringPreference("userId", userData.sId);
      SharedPreference.saveStringPreference("name", userData.name);
      setState(() {
        isRegistering = false;
      });
      Navigator.of(context).pushNamed(
        RidooRouter.ROUTE_START_APPLICATION,
        arguments: userData.name,
      );
    } else {
      setState(() {
        isRegistering = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorButtonBorder,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpacing(hDimen(20)),
          Center(
            child: Container(
              height: hDimen(50),
              width: hDimen(100),
              child: Image.asset(
                'assets/ridooLogoNew.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          vSpacing(hDimen(15)),
          Padding(
            padding: EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(20),
            ),
            child: Text(
              "Welcome new Partner! Let's Start",
              style: TextStyle(
                fontSize: hDimen(18),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          vSpacing(hDimen(20)),
          Padding(
            padding: EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(20),
            ),
            child: Text(
              "Please enter the driver details",
              style: TextStyle(
                fontSize: hDimen(14),
                color: Colors.black54,
              ),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: hDimen(20),
                  right: hDimen(20),
                  bottom: hDimen(20),
                ),
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSpacing(hDimen(20)),
                    CustomTextfieldWidget(
                      inputType: TextInputType.text,
                      hintText: "Your name",
                      labelTxt: "Name",
                      focusNode: nodeName,
                      controller: name,
                      onSubmitted: () {
                        nodeName.unfocus();
                        nodeEmail.requestFocus();
                      },
                    ),
                    vSpacing(hDimen(15)),
                    CustomTextfieldWidget(
                      inputType: TextInputType.emailAddress,
                      hintText: "Email Address (Optional)",
                      labelTxt: "Email Address",
                      focusNode: nodeEmail,
                      controller: email,
                      onSubmitted: () {
                        nodeEmail.unfocus();
                        nodePhoneNo.requestFocus();
                      },
                    ),
                    vSpacing(hDimen(15)),
                    Text(
                      "Mobile Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(14),
                        color: Colors.black,
                      ),
                    ),
                    vSpacing(hDimen(10)),
                    TextfieldWithDropdown(
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      controller: phoneNo,
                      focusNode: nodePhoneNo,
                      hintText: "10 digit phone number..",
                      obscureText: false,
                      minLines: 1,
                      maxLength: 10,
                      onChange: (value) {},
                      onSubmitted: (value) {
                        nodePhoneNo.unfocus();
                      },
                      onDropDown: (value) {
                        print(value);
                      },
                    ),
                    vSpacing(hDimen(20)),
                    Text(
                      "City you drive in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(14),
                        color: Colors.black,
                      ),
                    ),
                    vSpacing(hDimen(10)),
                    Container(
                      padding: EdgeInsets.only(
                        left: hDimen(10),
                      ),
                      height: hDimen(50),
                      // width: hDimen(300),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            spreadRadius: 4,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        value: dropdownValue,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: hDimen(25),
                        ),
                        iconSize: hDimen(25),
                        // elevation: 10,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: hDimen(14),
                        ),
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          "Kolkata",
                          "Chennai",
                          "Bangalore",
                          "Delhi",
                          "Ahmedabad",
                          "Pondicherry",
                          "Puri",
                          "Mumbai",
                          "Shillong",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    vSpacing(hDimen(20)),
                    CustomTextfieldWidget(
                      inputType: TextInputType.text,
                      hintText: "Referrel code (Optional)",
                      labelTxt: "Referrel code",
                      focusNode: nodeReferelCode,
                      controller: referelCode,
                      onSubmitted: (value) {
                        nodeReferelCode.unfocus();
                      },
                    ),
                    vSpacing(hDimen(20)),
                    isRegistering
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              backgroundColor: AppColor.colorButton,
                            ),
                          )
                        : CustomButton(
                            buttonText: "Continue",
                            onClick: () {
                              String validMail = '';
                              if (phoneNo.text != null &&
                                  name.text != null &&
                                  dropdownValue.isNotEmpty) {
                                if (email.text != null &&
                                    email.text.isNotEmpty) {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(email.text);
                                  if (!emailValid) {
                                    WidgetHelper.showToastMessage(
                                        'Please enter a valid email address.');
                                  } else {
                                    validMail = email.text;
                                  }
                                }
                                if (phoneNo.text.length == 10) {
                                  registerUser(
                                    phoneNo: phoneNo.text,
                                    name: name.text,
                                    city: dropdownValue,
                                    countryCode: "+91",
                                    email: validMail,
                                    referalCode: referelCode.text != null
                                        ? referelCode.text
                                        : "",
                                  );
                                } else {
                                  WidgetHelper.showToastMessage(
                                    'Please enter a valid phone number.',
                                  );
                                }
                              }
                            },
                          ),
                    vSpacing(hDimen(20)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
