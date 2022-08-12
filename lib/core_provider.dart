import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http_provider/http_provider.dart';
import 'package:http_provider/isolate_provider.dart';

class CoreProvider {
  static Future<HttpModel> coreProviderFormData({
    required String url,
    Map<String, String>? parameter,
    Map<String, String>? image,
    Map<String, String>? header,
    required String method,
    required String typeApi,
    String? token,
  }) async {
    var response = await ServiceProvider.httpHelper(
      url: url,
      method: method,
      typeApi: typeApi,
      header: header,
    );

    var obj = await response.value?.stream.bytesToString();
    if (response.message != StringProvider.valueSucces) {
      if (kDebugMode) {
        print('Failed');
      }
      return const HttpModel(message: StringProvider.valuefailed);
    } else if (response.value?.statusCode != 200) {
      if (kDebugMode) {
        print({'Api $typeApi Response Code': response.value?.statusCode});
      }
      return HttpModel(
        message: StringProvider.valuefailed,
        value: json.decode(obj!),
      );
    }

    if (kDebugMode) {
      print({'Api $typeApi Result ': obj});
    }
    if (obj == null) {
      return const HttpModel(message: StringProvider.valuefailedDecodeObject);
    } else {
      if (obj.isEmpty) {
        throw const HttpModel(message: StringProvider.valuefailedDecodeObject);
      }
      var object = await compute(IsolateProvider.jsonDecoderValue, obj);
      return HttpModel(message: StringProvider.valueSucces, value: object);
    }
  }
}
