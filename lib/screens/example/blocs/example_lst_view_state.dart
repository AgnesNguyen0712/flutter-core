import 'package:flutter_core/domain/entities/example.dart';
import 'package:equatable/equatable.dart';

abstract class ExampleLstViewState extends Equatable {
  @override
  List<Object> get props => [];
}

class ExampleLstViewLoading extends ExampleLstViewState {
}

class ExampleLstViewLoaded extends ExampleLstViewState {
  final List<Example> examples;
  final bool hasReachedMax;

  ExampleLstViewLoaded(this.examples, this.hasReachedMax);

  ExampleLstViewLoaded copyWith({
    List<Example>? exampleList,
    bool? hasReachedMax,
  }) {
    return ExampleLstViewLoaded(
      exampleList ?? this.examples,
      hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  List<Object> get props => [this.examples, this.hasReachedMax];
}

class ExampleLstViewFailure extends ExampleLstViewState {
  final String message;
  
  ExampleLstViewFailure(this.message);

  @override
  List<Object> get props => [message];
}
