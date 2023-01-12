import 'package:dartz/dartz.dart';
import 'package:noisegenflutter/core/error/exceptions.dart';
import 'package:noisegenflutter/core/error/failures.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/noise.dart';
import '../../domain/repository/noise_repository.dart';
import '../datasources/noise_remote_data_source.dart';

class NoiseRepositoryImpl implements NoiseRepository {
  final NoiseRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NoiseRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Noise>> createNoise() async {
    if (!await networkInfo.isConnected) {
      print("Network Failed!");
      return Left(NetworkFailure());
    }

    try {
      final remoteNoise = await remoteDataSource.getRandomNoise();
      return Right(remoteNoise);
    } on ServerException {
      print("Server Failed!");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Noise>> getNoise(String id) {
    // TODO: implement getNoise
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Noise>>> getNoises() {
    // TODO: implement getNoises
    throw UnimplementedError();
  }
}
