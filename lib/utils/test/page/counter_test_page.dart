import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/counter_bloc.dart';

class CounterTestPage extends StatelessWidget {
  const CounterTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            String text = "${state.value}";
            if (state.state == BlocCounterState.error) text = "error";
            return child(text, context);
          },
        ),
      ),
    );
  }

  TextButton child(String text, BuildContext context) {
    final Random random = Random();
    return TextButton(
      onPressed: () {
        BlocProvider.of<CounterBloc>(context).add(
          AddValueEvent(
            value: random.nextInt(14),
          ),
        );
      },
      child: Text(text),
    );
  }
}
