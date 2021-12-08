import 'dart:async';

import 'package:flutter_core/core/error/exceptions.dart';
import 'package:flutter_core/core/utils/constants.dart';
import 'package:flutter_core/domain/usecases/example_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'example_lst_view_event.dart';
import 'example_lst_view_state.dart';

class ExampleLstViewBloc extends Bloc<ExampleLstViewEvent, ExampleLstViewState> {
  final ExampleUseCase exampleUseCase;

  ExampleLstViewBloc(this.exampleUseCase) : super(ExampleLstViewLoading());

  // One optimization we can make is to debounce the Events in order to prevent spamming our API unnecessarily
  @override
  Stream<Transition<ExampleLstViewEvent, ExampleLstViewState>> transformEvents(
    Stream<ExampleLstViewEvent> events,
    TransitionFunction<ExampleLstViewEvent, ExampleLstViewState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(Duration(milliseconds: Constants.debounceTime)),
      transitionFn,
    );
  }

  @override
  Stream<ExampleLstViewState> mapEventToState(ExampleLstViewEvent event) async* {
    try {
      if (event is LoadExampleLstView) {
        yield* _mapRefreshExampleLstViewToState();
      } else if (event is RefreshExampleLstView) {
        yield* _mapRefreshExampleLstViewToState();
      } else if (event is LoadMoreExampleLstView) {
        yield* _mapLoadMoreExampleLstViewToState();
      }
    } on CustomException catch (e) {
      yield ExampleLstViewFailure(e.toString());
    }
  }

  Stream<ExampleLstViewState> _mapRefreshExampleLstViewToState() async* {
    final examples = await this
        .exampleUseCase
        .fetchExamples(0, Constants.pageSize);
    yield ExampleLstViewLoaded(examples, hasRechedMax(examples.length));
  }

  Stream<ExampleLstViewState> _mapLoadMoreExampleLstViewToState() async* {
    final currentState = state;
    if (currentState is ExampleLstViewLoaded) {
      final examples = await this
          .exampleUseCase
          .fetchExamples(currentState.examples.length, Constants.pageSize);
      if (examples.isEmpty) {
        yield currentState.copyWith(hasReachedMax: true);
      } else {
        yield ExampleLstViewLoaded(currentState.examples + examples, hasRechedMax(examples.length));
      }
    }
  }

  bool hasRechedMax(int length) {
    return length < Constants.pageSize;
  }
}
