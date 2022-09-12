import 'package:flutter/foundation.dart';

void cPrint(dynamic msg){
  if (kDebugMode) {
    print(msg);
  }
}