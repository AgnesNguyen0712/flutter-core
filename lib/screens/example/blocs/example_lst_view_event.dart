import 'package:equatable/equatable.dart';

abstract class ExampleLstViewEvent extends Equatable {
  ExampleLstViewEvent();

  @override
  List<Object> get props => [];
}

class LoadExampleLstView extends ExampleLstViewEvent {
}

class RefreshExampleLstView extends ExampleLstViewEvent {
}

class LoadMoreExampleLstView extends ExampleLstViewEvent {
}