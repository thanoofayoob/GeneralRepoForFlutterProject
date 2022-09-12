import 'package:get/instance_manager.dart';

import '../network/DioClient.dart';

class AuthRepo {
  final _dio = Get.find<DioClient>();

  // Future<ApiResponse<String>> signUpGetOtp(
  //     {required String name, required String email, required int countryId, required String mobile, required String type}) async {
  //   try {
  //     BaseResponse response = await _dio.request(
  //       endPoint: EndPoint.signUpOtp,
  //       data: SignUpRequest(name: name, email: email, mobile: mobile, type: userType.toLowerCase(), countryId: countryId).toJson(),
  //     );
  //
  //     if (response.code == 422) {
  //       return ApiResponse.unProcessable(response.message);
  //     } else {
  //       return ApiResponse<String>.completed(response.data);
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     // Get.find<LoadingController>().updateLoadStatus(LoadStatus.showError);
  //     return ApiResponse<String>.error(e.toString());
  //   }
  // }
}
