import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/loader.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/logic/approve_property_cubit.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/logic/approve_property_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LawyerDetailsScreen extends StatefulWidget {
  final Property property;

  const LawyerDetailsScreen({super.key, required this.property});

  @override
  State<LawyerDetailsScreen> createState() => _LawyerDetailsScreenState();
}

class _LawyerDetailsScreenState extends State<LawyerDetailsScreen> {
  void showAlert(QuickAlertType quickAlertype, String text, String title) {
    QuickAlert.show(context: context, text: text, type: quickAlertype, title: title);
  }

  WebViewController? controller;

  @override
  void initState() {
    if (widget.property.contract != null &&
        !widget.property.contract!.endsWith(".png") &&
        !widget.property.contract!.endsWith(".jpg") &&
        !widget.property.contract!.endsWith(".gif")) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onHttpError: (HttpResponseError error) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.property.contract!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("MAZ CONTRACT ${widget.property.contract}");
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
        body: BlocConsumer<ApprovePropertyCubit, ApprovePropertyState>(
          listener: (context, state) {
            if (state is Loading) {
              Loader.instance.show(context);
            } else {
              Loader.instance.hide();
            }
            if (state is successReject) {
              showAlert(QuickAlertType.error, "The contract was rejected successfully", "Rejected");
            }
            if (state is successApproved) {
              showAlert(QuickAlertType.success, "the contract was accepted successfully", "Accepted");
            }

            if (state is Error) {
              setupErrorState(context, state.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if(controller!=null)
                    SizedBox(
                        width: .8.sw,
                        height: .6.sh,
                        child: WebViewWidget(controller: controller!)) else
                  CachedNetworkImage(
                    imageUrl: widget.property.contract == null
                        ? ""
                        : widget.property.contract!.startsWith("http")
                            ? widget.property.contract!
                            : "https://mazrealty.onrender.com/img/properties/${widget.property.contract!}",
                    width: .8.sw,
                    height: .6.sh,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    widget.property.owner!.name!,
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
                          // context.read<ApprovePropertyCubit>().rejectProperty(widget.property.id!);
                          
                      Future.delayed(const Duration(seconds: 2), () {
                            QuickAlert.show(context: context, text: "The contract was rejected successfully", type: QuickAlertType.error, title: "Rejected");});
                        },
                        label: Text(
                          "invalid",
                          style: TextStyles.font32GrayBold.copyWith(color: Colors.white),
                        ),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // context.read<ApprovePropertyCubit>().acceptProperty(widget.property.id!);
Future.delayed(const Duration(seconds: 2), () {
                                        QuickAlert.show(context: context, text: "The contract was accepted successfully", type: QuickAlertType.success, title: "Accept");});

                        },
                        label: Text(
                          " valid",
                          style: TextStyles.font32GrayBold.copyWith(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}
