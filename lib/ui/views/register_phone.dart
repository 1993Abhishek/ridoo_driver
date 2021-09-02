import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/helper/static_widget_helper.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';
import 'package:ridoo_driver/ui/widgets/textfieldWithdropdown.dart';

class RegisterWithPhone extends StatefulWidget {
  const RegisterWithPhone({Key key}) : super(key: key);

  @override
  _RegisterWithPhoneState createState() => _RegisterWithPhoneState();
}

class _RegisterWithPhoneState extends State<RegisterWithPhone> {
  TextEditingController phoneNo = TextEditingController();
  FocusNode nodePhone = FocusNode();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                padding: EdgeInsets.only(left:hDimen(5)),
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.black,
                  size: hDimen(35),
                ),
              ),
            ),
            vSpacing(hDimen(20)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(15),
                right: hDimen(20),
              ),
              child: Text(
                "Enter your phone number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: hDimen(18),
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            vSpacing(hDimen(20)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(15),
                right: hDimen(20),
              ),
              child: Text(
                "This number will be used to contact you and\ncommunicate all ride related details",
                style: TextStyle(
                  fontSize: hDimen(14),
                  color: Colors.black54,
                  fontFamily: 'Questrial',
                ),
              ),
            ),
            vSpacing(hDimen(40)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(15),
                right: hDimen(20),
              ),
              child: TextfieldWithDropdown(
                textInputAction: TextInputAction.next,
                inputType: TextInputType.phone,
                maxLines: 1,
                controller: phoneNo,
                focusNode: nodePhone,
                hintText: "10 digit phone number..",
                obscureText: false,
                maxLength: 10,
                onChange: (value) {
                  // remindMe.text = value;
                },
                onSubmitted: (value) {
                  nodePhone.unfocus();
                },
              ),
            ),
            vSpacing(hDimen(100)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(15),
                right: hDimen(20),
              ),
              child: CustomButton(
                buttonText: "Next",
                onClick: () {
                  if(phoneNo.text.length==10)
                  {
                    Navigator.of(context)
                        .pushNamed(RidooRouter.ROUTE_OTP_VERIFICATION,arguments: phoneNo.text,);
                  }
                  else
                    WidgetHelper.showToastMessage('Please enter correct phone number');
                },
              ),
            ),
            vSpacing(hDimen(40)),
          ],
        ),
      ),
    );
  }
}
