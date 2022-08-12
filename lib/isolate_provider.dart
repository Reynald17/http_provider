import 'dart:convert';

class IsolateProvider {
  static dynamic jsonDecoderValue(String obj) {
    var object = json.decode(obj);
    return object;
  }
}
