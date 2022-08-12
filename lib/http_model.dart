import 'package:equatable/equatable.dart';
import 'package:http_provider/enu_class.dart';

class HttpModel<T> extends Equatable {
  final T? value;
  final StringProvider? message;
  const HttpModel({this.message, this.value});

  @override
  List<Object?> get props => [value, message];
}
