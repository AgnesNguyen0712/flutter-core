import 'dart:convert';

import 'package:flutter_core/data/models/example_model.dart';



abstract class ExampleLocal {
  Future<List<ExampleModel>> fetchExamples(int startIndex, int limit);
}

class ExampleMockLocalImpl implements ExampleLocal {
  @override
  Future<List<ExampleModel>> fetchExamples(int startIndex, int limit) {
    return Future.delayed(Duration(seconds: 3), () {
      var response = json.decode(
          "[{\"id\":1,\"title\":\"JSON to String Online Converter\",\"body\":\"JSON to String Online Converter\"},{\"id\":2,\"title\":\"JSON to String Online Converter\",\"body\":\"JSON to String Online Converter\"},{\"id\":3,\"title\":\"JSON to String Online Converter\",\"body\":\"JSON to String Online Converter\"},{\"id\":4,\"title\":\"JSON to String Online Converter\",\"body\":\"JSON to String Online Converter\"},{\"id\":5,\"title\":\"JSON to String Online Converter\",\"body\":\"JSON to String Online Converter\"},{\"id\":6,\"title\":\"JSON to String Online Converter\",\"body\":\"JSON to String Online Converter\"}]");
      var list = response as List;
      return list.map((i) => ExampleModel.fromJson(i)).toList();
    });
  }
}
