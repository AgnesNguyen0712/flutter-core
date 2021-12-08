

import 'package:flutter_core/domain/entities/example.dart';
import 'package:flutter_core/domain/repositories/example_repository.dart';

class ExampleUseCase {
  final ExampleRepository _repository;
  ExampleUseCase(this._repository);

  Future<List<Example>> fetchExamples(int startIndex, int limit) async {
    return await _repository.fetchExamples(startIndex, limit);
  }
}