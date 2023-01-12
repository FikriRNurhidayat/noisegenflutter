import 'package:dartz/dartz.dart';
import 'package:noisegenflutter/core/error/failures.dart';

import '../entities/noise.dart';

abstract class NoiseRepository {
  Future<Either<Failure, Noise>> createNoise();
  Future<Either<Failure, Noise>> getNoise(String id);
  Future<Either<Failure, List<Noise>>> getNoises();
}
