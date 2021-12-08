

import 'package:flutter_core/core/utils/constants_model.dart';
import 'package:flutter_core/domain/entities/example.dart';

class ExampleModel extends Example {
  ExampleModel(int id, String title, String body) : super(id, title, body);

  factory ExampleModel.fromJson(dynamic json) {
    return ExampleModel(json[ConstantsModel.idExample], json[ConstantsModel.titleExample], json[ConstantsModel.bodyExample]);
  }
}