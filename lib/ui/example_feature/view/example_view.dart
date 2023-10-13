import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/ui/example_feature/bloc/example_bloc.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc with Streams')),
      body: Center(
        child: BlocBuilder<ExampleBloc, ExampleState>(
          builder: (context, state) {
            return switch (state) {
              ExampleInitialState() =>
                const Text('Initial State, press the button to start'),
              ExampleSuccessState() =>
                Text('Name: ${state.item.name}'),
              ExampleFailState() => const Text('Some error catch !')
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<ExampleBloc>().add(const ExampleFetchData()),
        tooltip: 'Start',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
