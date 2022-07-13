part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class AddValueEvent extends CounterEvent {
  final int value;

  const AddValueEvent({required this.value});

  @override
  List<Object?> get props => [value];
}
