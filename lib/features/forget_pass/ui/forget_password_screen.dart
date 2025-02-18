import 'package:final_project/core/helpers/app_regex.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  void showAlert(QuickAlertType quickAlertype, String text, String title) {
    QuickAlert.show(
        context: context, text: text, type: quickAlertype, title: title);
  }
String? value;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 234, 225),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                "Reset Password",
                style:
                    TextStyles.font32lightGreenBold.copyWith(fontSize: 40.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Please enter your email address",
                style:
                    TextStyles.font28lightGrayMedium.copyWith(fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0.w, top: 5.h),
                child: TextFormField(
                  validator: (value) {
                    value = value;
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyles.font28lightGrayMedium
                          .copyWith(fontSize: 16.sp),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsManager.lightGreen))),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0.w),
                child: ElevatedButton(
                  
                  onPressed: () {
                      if (value == null ||
                        value!.isEmpty ||
                        !AppRegex.isEmailValid(value!)) {
                      return showAlert(QuickAlertType.error, "Please enter a valid email", "Error");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorsManager.green),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 2.h)),
                  ),
                  child: Text(
                    "Reset Password",
                    style:
                        TextStyles.font32GrayBold.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
