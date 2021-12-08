

import 'package:flutter_core/core/network/api_provider.dart';
import 'package:flutter_core/data/models/example_model.dart';

abstract class ExampleRemote {
  Future<List<ExampleModel>> fetchExamples(int startIndex, int limit);
}

class ExampleRemoteImpl implements ExampleRemote {
  ExampleRemoteImpl(this.apiProvider, this.baseUrl);
  final ApiProvider apiProvider;
  final String baseUrl;

  @override
  Future<List<ExampleModel>> fetchExamples(int startIndex, int limit) async {
    final response = await apiProvider
        .get("$baseUrl/posts?_start=$startIndex&_limit=$limit");
    var list = response as List;
    return list.map((i) => ExampleModel.fromJson(i)).toList();
  }
}