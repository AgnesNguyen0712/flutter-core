

import 'package:flutter_core/data/sources/local/example_local.dart';
import 'package:flutter_core/data/sources/remote/example_remote.dart';
import 'package:flutter_core/domain/entities/example.dart';
import 'package:flutter_core/domain/repositories/example_repository.dart';

class ExampleRepositoryImplement implements ExampleRepository {
  final ExampleRemote exampleRemote;
  final ExampleLocal exampleLocal;
  final bool isMock;
  ExampleRepositoryImplement(this.exampleRemote, this.exampleLocal, this.isMock);

  @override
  Future<List<Example>> fetchExamples(int startIndex, int limit) {
    if (this.isMock) {
      return this.exampleLocal.fetchExamples(startIndex, limit);
    }
    return this.exampleRemote.fetchExamples(startIndex, limit);
  }

}