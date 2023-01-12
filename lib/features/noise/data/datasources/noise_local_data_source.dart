import '../models/noise_model.dart';

abstract class NoiseLocalDataSource {
  Future<List<NoiseModel>> getNoises();
  Future<NoiseModel> getNoise(String id);
  Future<void> cacheNoise(NoiseModel noise);
}

class NoiseLocalDataSourceImpl implements NoiseLocalDataSource {
  @override
  Future<void> cacheNoise(NoiseModel noise) {
    // TODO: implement cacheNoise
    throw UnimplementedError();
  }

  @override
  Future<NoiseModel> getNoise(String id) {
    // TODO: implement getNoise
    throw UnimplementedError();
  }

  @override
  Future<List<NoiseModel>> getNoises() {
    // TODO: implement getNoises
    throw UnimplementedError();
  }
}
