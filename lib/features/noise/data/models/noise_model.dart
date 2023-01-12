import 'dart:typed_data';

import 'package:uuid/uuid.dart';

import '../../domain/entities/noise.dart';

class NoiseModel extends Noise {
  const NoiseModel({
    required id,
    required bytes,
  }) : super(id: id, bytes: bytes);

  factory NoiseModel.fromBytes(Uint8List bytes) {
    var uuid = const Uuid();
    return NoiseModel(
      id: uuid.v4(),
      bytes: bytes,
    );
  }

  factory NoiseModel.fromJson(Map<String, dynamic> json) {
    final String byteString = json['bytes'];
    final List<int> codeUnits = byteString.codeUnits;

    return NoiseModel(
      id: json['id'],
      bytes: Uint8List.fromList(codeUnits),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'bytes': String.fromCharCodes(bytes),
    };
  }
}
