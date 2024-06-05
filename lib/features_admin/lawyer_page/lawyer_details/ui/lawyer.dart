import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

// ignore: camel_case_types
class lawyerDetailsScreenn extends StatefulWidget {
  const lawyerDetailsScreenn({super.key});

  @override
  State<lawyerDetailsScreenn> createState() => _lawyerDetailsScreennState();
}

class _lawyerDetailsScreennState extends State<lawyerDetailsScreenn> {
  void showAlert(QuickAlertType quickAlertype, String text, String title) {
    QuickAlert.show(
        context: context, text: text, type: quickAlertype, title: title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 234, 225),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network("https://th.bing.com/th/id/R.0febaa682699dc187293f686e466039e?rik=f4G3AlfJZP9Dfg&pid=ImgRaw&r=0",
              width: .8.sw,
                height: .6.sh,
                fit: BoxFit.fill,
              ),
            
              SizedBox(
                height: 12.h,
              ),
              Text(
                " Mohamed Shebl",
                style: TextStyles.font32GrayBold,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      QuickAlert.show(context: context, text: "The contract was rejected successfully", type: QuickAlertType.error, title: "Rejected");
                    },
                    label: Text(
                      "invalid",
                      style: TextStyles.font32GrayBold
                          .copyWith(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      
              QuickAlert.show(context: context, text: "The contract was accepted successfully", type: QuickAlertType.success, title: "Accept");

                    },
                    label: Text(
                      " valid",
                      style: TextStyles.font32GrayBold
                          .copyWith(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
