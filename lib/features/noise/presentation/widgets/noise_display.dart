// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:noisegenflutter/features/noise/presentation/cubit/noise_cubit.dart';

class NoiseDisplay extends StatelessWidget {
  const NoiseDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitBuilder<NoiseCubit, NoiseState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NOISE',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 32),
                  state is NoiseLoaded
                      ? Text(
                          state.noise.id,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 32),
                  state is NoiseLoaded
                      ? Image.memory(state.noise.bytes)
                      : const SizedBox(),
                  const SizedBox(height: 32),
                  OutlinedButton(
                      onPressed: () {
                        context.cubit<NoiseCubit>().back();
                      },
                      child: const Text("Back",
                          style: TextStyle(color: Colors.black)))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
