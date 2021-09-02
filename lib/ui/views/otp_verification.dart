import 'package:flutter/material.dart';
import 'package:ridoo_driver/core/repository/otp_verify_repo.dart';
import 'package:ridoo_driver/router.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_view_helper.dart';
import 'package:ridoo_driver/ui/widgets/custom_button.dart';
import 'package:ridoo_driver/ui/widgets/otp_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ridoo_driver/ui/helper/static_widget_helper.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNo;

  const OtpVerification({
    Key key,
    this.phoneNo,
  }) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController otp1 = TextEditingController(),
      otp2 = TextEditingController(),
      otp3 = TextEditingController(),
      otp4 = TextEditingController(),
      otp5 = TextEditingController(),
      otp6 = TextEditingController();

  FocusNode nodeOtp1 = FocusNode(),
      nodeOtp2 = FocusNode(),
      nodeOtp3 = FocusNode(),
      nodeOtp4 = FocusNode(),
      nodeOtp5 = FocusNode(),
      nodeOtp6 = FocusNode();

  String verificationId = "";
  String OtpCode = "";

  Future authenticateWithOtp() async {
    mPrintln("Phone Number:${widget.phoneNo}");

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential authCredential) {
      WidgetHelper.showToastMessage("Verification completed successfully");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      mPrintln(authException.message);
      WidgetHelper.showToastMessage(
        "Verification is Failed. Please check your phone number and OTP.\n${authException.message}",
      );
    };
    PhoneCodeSent codeSent =
        (String verificationIdLocal, [int forceResendingToken]) {
      verificationId = verificationIdLocal;
      WidgetHelper.showToastMessage(
        "Verification code is sent on the phone number.",
      );
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      WidgetHelper.showToastMessage("Time Out");
    };

    try {
      var result = await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + widget.phoneNo,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: Duration(
          seconds: 35,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
  OtpVerificationRepo otpVerificationRepo=OtpVerificationRepo();

  Future signInWithPhoneNumber({
    String verificationCode,
    String smsCode,
  }) async {
    try {
      mPrintln("Verification Code:$verificationCode");
      mPrintln("SMS Code:$smsCode");

      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: smsCode,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      mPrintln("User:${userCredential.user}");
      if(userCredential.user!=null){
        dynamic data={
          "idToken":verificationCode,
        };
        otpVerificationRepo.fetchUserOTP(data: data);
        Navigator.of(context).pushNamed(
          RidooRouter.ROUTE_REGISTER_DETAILS,
        );
      }
      else WidgetHelper.showToastMessage("Not Authenticated");
    } catch (e) {
      mPrintln(e);
      WidgetHelper.showToastMessage(e.toString());
    }
    // Navigator.of(context).pushNamed(
    //   RidooRouter.ROUTE_REGISTER_DETAILS,
    // );
  }

  @override
  void initState() {
    authenticateWithOtp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: hDimen(200),
              width: hDimen(200),
              child: Image.asset(
                'assets/R3.png',
                fit: BoxFit.cover,
              ),
            ),
            vSpacing(hDimen(20)),
            Text(
              "Verification",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: hDimen(20),
              ),
            ),
            vSpacing(hDimen(20)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "We have sent you a ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: hDimen(14),
                  ),
                ),
                Text(
                  "One Time Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(14),
                  ),
                ),
              ],
            ),
            Text(
              "on your registered phone number",
              style: TextStyle(
                color: Colors.black54,
                fontSize: hDimen(14),
              ),
            ),
            vSpacing(hDimen(40)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpTextField(
                  textAlign: TextAlign.center,
                  onChange: (value) {
                    if (value != null) {
                      nodeOtp1.unfocus();
                      nodeOtp2.requestFocus();
                    }
                  },
                  controller: otp1,
                  focusNode: nodeOtp1,
                  hintText: " ",
                  inputType: TextInputType.number,
                ),
                hSpacing(hDimen(10)),
                OtpTextField(
                  textAlign: TextAlign.center,
                  onChange: (value) {
                    if (value != null) {
                      nodeOtp2.unfocus();
                      nodeOtp3.requestFocus();
                    }
                  },
                  controller: otp2,
                  focusNode: nodeOtp2,
                  hintText: " ",
                  inputType: TextInputType.number,
                ),
                hSpacing(hDimen(10)),
                OtpTextField(
                  textAlign: TextAlign.center,
                  onChange: (value) {
                    if (value != null) {
                      nodeOtp3.unfocus();
                      nodeOtp4.requestFocus();
                    }
                  },
                  controller: otp3,
                  focusNode: nodeOtp3,
                  hintText: " ",
                  inputType: TextInputType.number,
                ),
                hSpacing(hDimen(10)),
                OtpTextField(
                  textAlign: TextAlign.center,
                  onChange: (value) {
                    if (value != null) {
                      nodeOtp4.unfocus();
                      nodeOtp5.requestFocus();
                    }
                  },
                  controller: otp4,
                  focusNode: nodeOtp4,
                  hintText: " ",
                  inputType: TextInputType.number,
                ),
                hSpacing(hDimen(10)),
                OtpTextField(
                  textAlign: TextAlign.center,
                  onChange: (value) {
                    if (value != null) {
                      nodeOtp5.unfocus();
                      nodeOtp6.requestFocus();
                    }
                  },
                  controller: otp5,
                  focusNode: nodeOtp5,
                  hintText: " ",
                  inputType: TextInputType.number,
                ),
                hSpacing(hDimen(10)),
                OtpTextField(
                  textAlign: TextAlign.center,
                  onChange: (value) {
                    if (value != null) {
                      nodeOtp6.unfocus();
                    }
                  },
                  controller: otp6,
                  focusNode: nodeOtp6,
                  hintText: " ",
                  inputType: TextInputType.number,
                ),
              ],
            ),
            vSpacing(hDimen(20)),
            CustomButton(
              buttonText: "Enter the OTP",
              onClick: () {
                String otp = otp1.text +
                    otp2.text +
                    otp3.text +
                    otp4.text +
                    otp5.text +
                    otp6.text;
                signInWithPhoneNumber(smsCode: otp,verificationCode: verificationId,);
              },
              width: hDimen(250),
            ),
            vSpacing(hDimen(20)),
            GestureDetector(
              onTap: () {
                print('Resend');
                authenticateWithOtp();
              },
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: hDimen(14),
                ),
              ),
            ),
            vSpacing(hDimen(20)),
          ],
        ),
      ),
    );
  }
}
