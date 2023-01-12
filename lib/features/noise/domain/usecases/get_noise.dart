import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:noisegenflutter/core/error/failures.dart';
import 'package:noisegenflutter/core/usecases/usecase.dart';

import '../entities/noise.dart';
import '../repository/noise_repository.dart';

class GetNoise implements UseCase<Noise, Params> {
  final NoiseRepository repository;

  GetNoise(this.repository);

  @override
  Future<Either<Failure, Noise>> call(Params params) async {
    return await repository.getNoise(params.id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
