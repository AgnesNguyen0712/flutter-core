


import 'package:flutter_core/domain/entities/example.dart';

abstract class ExampleRepository {
  Future<List<Example>> fetchExamples(int startIndex, int limit);
}