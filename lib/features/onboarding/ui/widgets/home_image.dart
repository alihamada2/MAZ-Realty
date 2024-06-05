import 'package:final_project/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        
        Image.asset(
          "assets/imgs/icone_home.png",
          width:931.9.w,
          height: 455.h,
        ),
        Image.asset(
          "assets/imgs/home.png",
          width: 470.71.w,
          height: 484.89.h,
          fit: BoxFit.fill,
        ),
        const Positioned(
          bottom: 125,
          left: 87,
          child: GetStartedButton(),
        )
      ],
    );
  }
}
