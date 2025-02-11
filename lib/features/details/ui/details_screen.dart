import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/helpers/communication_service.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/chat/logic/chat_cubit.dart';
import 'package:final_project/features/chat/model/message_model.dart';
import 'package:final_project/features/chat/ui/chat_screen.dart';
import 'package:final_project/features/details/logic/details_cubit.dart';
import 'package:final_project/features/home_details/logic/home_cubit.dart';
import 'package:final_project/features/screens/details_payment_screen.dart';
import 'package:final_project/features/screens/payment_screen.dart';
import 'package:final_project/features/search/data/model/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/shared_pres.dart';

class DetailsScreen extends StatefulWidget {
  FilterData property;
  final bool isFilter;

  DetailsScreen({super.key, required this.property, required this.isFilter});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? userId;
  List<Message> messages = [];

  @override
  void initState() {
    context
        .read<HomeCubit>()
        .get0neProperty(widget.property.sId!)
        .then((v) => setState(() {
              userId = v.owner.sId;
            }))
        .then((v) async {});

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 234, 225),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            const Gap(20),
            SizedBox(
                height: .4.sh,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: widget.property.images!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: CachedNetworkImage(
                            imageUrl: widget.property.images![index]
                                    .startsWith("http")
                                ? widget.property.images![index]
                                : "https://mazrealty.onrender.com/img/properties/${widget.property.images![index]}",
                            height: .4.sh,
                            width: .9.sw,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 20.w,
                      right: 20.w,
                      top: 16.h,
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 36.w,
                              height: 36.h,
                              alignment: Alignment.center,
                              decoration: AppStyles.circleDecoration(
                                  color: Colors.black12),
                              child: IconButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.white,
                                    size: 14,
                                  )),
                            ),
                            Container(
                                width: 36.w,
                                height: 36.h,
                                alignment: Alignment.center,
                                decoration: AppStyles.circleDecoration(
                                    color: Colors.black12),
                                child: IconButton(
                                    onPressed: () {
                                      if (widget.property.isFav!) {
                                        widget.property.isFav = false;

                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text("Removed From Favorites"),
                                          backgroundColor: Colors.red,
                                        ));
                                        context
                                            .read<DetailsCubit>()
                                            .makeFavorite(
                                                widget.property.sId!,
                                                false);
                                      } else {
                                        widget.property.isFav = true;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Added To Favorites"),
                                          backgroundColor: Colors.green,
                                        ));
                                        setState(() {});
                                        context
                                            .read<DetailsCubit>()
                                            .makeFavorite(
                                                widget.property.sId!, true);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.bookmark_add_outlined,
                                      color: widget.property.isFav ?? false
                                          ? Colors.red
                                          : Colors.white,
                                      size: 14,
                                    ))),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: 80.h,
                      left: 26.w,
                      right: 26.w,
                      child: Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${widget.property.name}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              widget.property.address!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5.h, left: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 8.h,
                                width: 8.w,
                                margin: EdgeInsets.symmetric(horizontal: 8.h),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorsManager.lightBrown,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 120.w,
                                      child: Text(
                                        widget.property.owner!.name!,
                                        style: TextStyles.font35BlackBold
                                            .copyWith(
                                                fontWeight:
                                                    FontWeightHelper.medium),
                                      ),
                                    ),
                                    SizedBox(
                                      height: .2.h,
                                    ),
                                    Text("Owner",
                                        style: TextStyles.font29GrayRegular),
                                    SizedBox(height: 8.h),
                                  
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  width: 45.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.lighterBlue,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            CommunicationService.makePhoneCall(
                                                "+20${widget.property.owner!.phone!}");
                                          },
                                          icon: const Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                          )))),
                              Gap(8.w),
                              Container(
                                  width: 45.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.lighterBlue,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            CommunicationService.openWhatsAppChat(
                                                "+20${widget.property.owner!.phone!}",
                                                "");
                                          },
                                          icon: Image.asset(
                                            "assets/imgs/whatsapp.png",
                                            height: 30,
                                          )))),
                              Gap(8.w),
                              Container(
                                  width: 45.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.lighterBlue,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () async {
                                            var id =
                                                await SharedPres.getUserId();

                                            if (userId != null) {
                                              ChatCubit()
                                                  .fetchMessages(userId!)
                                                  .then((value) =>
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  ChatScreen(
                                                                    receiverId:
                                                                        userId!,
                                                                    messages:
                                                                        value,
                                                                    userId: id,
                                                                  ))));
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.chat,
                                            color: Colors.white,
                                          )))),
                              Gap(16.w),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Description",
                        style: TextStyles.font35BlackBold
                            .copyWith(fontSize: 17.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      HtmlWidget(
                        // the first parameter (`html`) is required
                        widget.property.description!,

                        // all other parameters are optional, a few notable params:

                        // specify custom styling for an element
                        // see supported inline styling below

                        renderMode: RenderMode.column,

                        // set the default styling for text
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
                width: 190.w,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DetailsPaymentScreen()));
                    },
                    child: const Text("Check The Contract")))
          ],
        ),
      ),
    );
  }
}
