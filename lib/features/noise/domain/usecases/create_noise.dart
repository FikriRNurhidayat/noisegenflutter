import 'package:dartz/dartz.dart';
import 'package:noisegenflutter/core/error/failures.dart';
import 'package:noisegenflutter/core/usecases/usecase.dart';

import '../entities/noise.dart';
import '../repository/noise_repository.dart';

class CreateNoise implements UseCase<Noise, NoParams> {
  final NoiseRepository repository;

  CreateNoise(this.repository);

  @override
  Future<Either<Failure, Noise>> call(NoParams params) async {
    return await repository.createNoise();
  }
}
