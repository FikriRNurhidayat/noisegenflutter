import 'package:flutter/material.dart';
import 'package:noisegenflutter/features/noise/presentation/pages/noise_page.dart';
import './container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Noisegen",
      theme: ThemeData(fontFamily: "VT323"),
      home: const NoisePage(),
    );
  }
}
