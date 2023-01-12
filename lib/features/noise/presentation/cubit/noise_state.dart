part of 'noise_cubit.dart';

@immutable
abstract class NoiseState {}

class NoiseInitial extends NoiseState {}

class NoiseLoading extends NoiseState {
  final int noiseAmount;

  NoiseLoading({
    required this.noiseAmount,
  });
}

class NoiseLoaded extends NoiseState {
  final Noise noise;

  NoiseLoaded(this.noise);
}
