// ignore_for_file: import_of_legacy_library_into_null_safe, depend_on_referenced_packages

import 'package:cubit/cubit.dart';
import 'package:meta/meta.dart';
import 'package:noisegenflutter/core/usecases/usecase.dart';
import 'package:noisegenflutter/features/noise/domain/usecases/get_noises.dart';

import '../../domain/entities/noise.dart';
import '../../domain/usecases/create_noise.dart';
import '../../domain/usecases/get_noise.dart';

part 'noise_state.dart';

class NoiseCubit extends Cubit<NoiseState> {
  final CreateNoise createNoise;
  final GetNoise getNoise;
  final GetNoises getNoises;

  NoiseCubit(
      {required this.createNoise,
      required this.getNoise,
      required this.getNoises})
      : super(NoiseInitial());

  void load(int noiseAmount) async {
    emit(NoiseLoading(noiseAmount: noiseAmount));

    final noiseResult = await createNoise(NoParams());

    // TODO: Simulate the progress
    await Future<void>.delayed(const Duration(seconds: 2));

    noiseResult.fold(
        (failure) => emit(NoiseInitial()), (noise) => emit(NoiseLoaded(noise)));
  }

  void back() async {
    emit(NoiseLoading(noiseAmount: 0));

    // TODO: Simulate the progress
    await Future<void>.delayed(const Duration(seconds: 2));

    emit(NoiseInitial());
  }
}
