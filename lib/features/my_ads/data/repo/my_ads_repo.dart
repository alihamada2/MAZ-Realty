import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/my_ads/data/model/my_ads_response.dart';

import '../../../search/data/model/filter_model.dart';

class MyAdsRepo {
  final ApiServices _apiServices;

  MyAdsRepo(
    this._apiServices,
  );

  Future<ApiResult<MyAdsResponse>> getMyAds() async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response = await _apiServices.getMyAds("Bearer $token");

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
