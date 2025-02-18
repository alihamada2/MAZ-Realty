import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/edit_profile/data/models/update_response.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/data/model/approve_contract_response.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/data/model/reject_contract_response.dart';

class ApprovePropertyRepo {
  final ApiServices _apiServices;

  ApprovePropertyRepo(this._apiServices);

  Future<ApiResult<ApproveContractResponse>> acceptProperty(
      String token, String propertyId) async {
    try {
      print("///////////////////////");
      print(propertyId);
      ApproveContractResponse response =
          await _apiServices.acceptProperty("Bearer $token", propertyId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RejectContractResponse>> rejectProperty(
      String token, String propertyId) async {
    try {
      var response =
          await _apiServices.rejectProperty("Bearer $token", propertyId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
