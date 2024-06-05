import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPaymentScreen extends StatefulWidget {
  const DetailsPaymentScreen({super.key});

  @override
  State<DetailsPaymentScreen> createState() => _DetailsPaymentScreenState();
}

class _DetailsPaymentScreenState extends State<DetailsPaymentScreen> {
    final webSiteUrl=Uri.parse("https://checkout.stripe.com/c/pay/cs_test_a1dykteTD9cTo04xpmSYv0zlcF0mA8aOAinsoibDSgdpxbounUA3G6vWir#fidkdWxOYHwnPyd1blpxYHZxWjA0VTJqPWFEXWhRTlduVmZiYXc2VU1iS2xBQkZdUVdkTD1hPX9pMmtVbVVjXDdTVkM3NHFHR3RHd1JSZ3dLT05kRkdAdmlqdjNOSj1OSEh%2FdUpVZkt3Xz1BNTVEcGxuXHw9cycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 234, 225),
          elevation: 1.2,
          title: const Text('Payment Details'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Text(
                " - The lawyer will review the contract, is\n    the apartment fake or true? ",
                style: TextStyles.font35BlackBold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.0.w, top: 10.0.h),
              child: Text(
                " - The lawyer will reply to you within\n     the next 48 hours ",
                style: TextStyles.font35BlackBold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.0.w, top: 10.0.h),
              child: Text(
                " - For this service for only  500 EGP ",
                style: TextStyles.font35BlackBold,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: SizedBox(
                  width: 150.w,
                  child: ElevatedButton(
                      onPressed: () {
                        launchUrl(webSiteUrl,
                        mode: LaunchMode.externalApplication
                        );
                      },
                      child: const Text("Pay Now"))),
            )
          ],
        ));
  }
}
