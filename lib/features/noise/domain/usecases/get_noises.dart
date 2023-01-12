import 'package:dartz/dartz.dart';
import 'package:noisegenflutter/core/error/failures.dart';
import 'package:noisegenflutter/core/usecases/usecase.dart';

import '../entities/noise.dart';
import '../repository/noise_repository.dart';

class GetNoises implements UseCase<List<Noise>, NoParams> {
  final NoiseRepository repository;

  GetNoises(this.repository);

  @override
  Future<Either<Failure, List<Noise>>> call(NoParams params) async {
    return await repository.getNoises();
  }
}
