class BaseResponse {
  String? message;
  int? code;
  late bool error;
  dynamic data;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    error = json['error'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (message != null) {
      data['message'] = message;
    }
    data['code'] = code;
    data['error'] = error;
    data['data'] = data;
    return data;
  }
}

class Errors {
  String? value;
  String? msg;
  String? param;
  String? location;

  Errors({this.value, this.msg, this.param, this.location});

  Errors.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['value'] = value;
    data['msg'] = msg;
    data['param'] = param;
    data['location'] = location;
    return data;
  }
}
