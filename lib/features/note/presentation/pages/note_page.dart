import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/bloc/status.dart';

import '../bloc/bloc/note_bloc.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if (state.status == BlocStatus.initial ||
                state.status == BlocStatus.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == BlocStatus.loaded) {
              return Text(state.notes[2].description);
            }
            return Text('${state.errorMessage}');
          },
        ),
      ),
    );
  }
}
