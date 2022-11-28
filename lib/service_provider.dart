import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as httpx;
import 'package:http_provider/enu_class.dart';
import 'package:http_provider/http_model.dart';

class ServiceProvider {
  static Future<HttpModel<httpx.StreamedResponse>> httpHelper({
    required String url,
    Map<String, String>? parameter,
    Map<String, String>? image,
    required String method,
    required String typeApi,
    Map<String, String>? header,
  }) async {
    try {
      var result = httpx.MultipartRequest(
        method,
        Uri.parse(url),
      );
      result.fields.addAll(parameter ?? {});
      if (image != null) {
        image.forEach((key, value) async {
          if (kDebugMode) {
            print({"image Key": key, "Image": value}.toString());
          }
          result.files.add(
            await httpx.MultipartFile.fromPath(key, value),
          );
        });
      }
      if (header != null) {
        result.headers.addAll(header);
      }

      if (kDebugMode) {
        print({
          "Type API": typeApi,
          'param': parameter,
          'header': header,
        });
      }

      httpx.StreamedResponse response = await result.send().timeout(
            const Duration(seconds: 20),
          );
      return HttpModel(message: StringProvider.valueSucces, value: response);
    } catch (e) {
      return const HttpModel(message: StringProvider.valueCatchHttp);
    }
  }
}
