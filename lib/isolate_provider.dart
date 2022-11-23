import 'dart:convert';

class IsolateProvider {
  static dynamic jsonDecoderValue(String obj) {
    try {
      var object = json.decode(obj);
      return object;
    } catch (e) {
      return null;
    }
  }
}
