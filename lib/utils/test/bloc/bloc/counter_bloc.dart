import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.init()) {
    on<AddValueEvent>(_addValueEvent);
  }

  FutureOr<void> _addValueEvent(
      AddValueEvent event, Emitter<CounterState> emit) async {
    emit(CounterState.init());
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        if (event.value > 10) return emit(CounterState.error());
        return emit(CounterState.done(event.value));
      },
    );
  }
}
