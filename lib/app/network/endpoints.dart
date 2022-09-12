import '../utils/AppConstants.dart';

enum EndPoint {
//otp
  signUpOtp,
}

extension URLExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.signUpOtp:
        return "${baseUrl}sign-up/generate-otp";

      default:
        throw Exception(["Endpoint not defined"]);
    }
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      //POST API'S
      case EndPoint.signUpOtp:
        requestType = RequestType.post;
        break;

        //GET API'S

        // case EndPoint.countryList:

        requestType = RequestType.get;
        break;

        //PUT API'S

        requestType = RequestType.put;
        break;

        break;

        // TODO: Handle this case.
        break;

        //delete api

        requestType = RequestType.delete;

        break;
    }
    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = true;

    switch (this) {
      case EndPoint.signUpOtp:
        shouldAdd = false;
        break;

      default:
        break;
    }

    return shouldAdd;
  }
}
