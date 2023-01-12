import 'package:http/http.dart';

import '../../../../core/error/exceptions.dart';
import '../models/noise_model.dart';

abstract class NoiseRemoteDataSource {
  Future<NoiseModel> getRandomNoise();
}

class NoiseRemoteDataSourceImpl implements NoiseRemoteDataSource {
  final Client client;

  NoiseRemoteDataSourceImpl({required this.client});

  @override
  Future<NoiseModel> getRandomNoise() async {
    var url = Uri.http("10.0.2.2:5178", "/noises:random");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return NoiseModel.fromBytes(response.bodyBytes);
    } else {
      throw ServerException();
    }
  }
}
