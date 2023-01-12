import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_cubit/flutter_cubit.dart';

import '../../../../container.dart';
import '../cubit/noise_cubit.dart';
import '../widgets/noise_control.dart';
import '../widgets/noise_display.dart';
import '../widgets/noise_loader.dart';

class NoisePage extends StatelessWidget {
  const NoisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CubitProvider(
          create: (_) => sl<NoiseCubit>(),
          child: CubitBuilder<NoiseCubit, NoiseState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case NoiseLoading:
                  return const NoiseLoader();
                case NoiseLoaded:
                  return const NoiseDisplay();
                default:
                  return const NoiseControl();
              }
            },
          )),
    );
  }
}
