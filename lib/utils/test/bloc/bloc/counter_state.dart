part of 'counter_bloc.dart';

enum BlocCounterState { init, done, error }

class CounterState extends Equatable {
  BlocCounterState state;
  int value;

  CounterState._({
    this.state = BlocCounterState.init,
    this.value = 0,
  });

  CounterState.init() : this._(state: BlocCounterState.init);

  CounterState.done(int value)
      : this._(state: BlocCounterState.done, value: value);

  CounterState.error() : this._(state: BlocCounterState.error);

  @override
  List<Object> get props => [state, value];
}
