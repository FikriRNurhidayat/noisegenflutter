import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class Noise extends Equatable {
  const Noise({required this.id, required this.bytes});

  // Generated UUID
  final String id;

  // Uint8List came from http.Response
  final Uint8List bytes;

  @override
  List<Object?> get props => [id, bytes];
}
