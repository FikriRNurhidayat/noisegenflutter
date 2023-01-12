import 'package:flutter/material.dart';

class NoiseLoader extends StatefulWidget {
  const NoiseLoader({super.key});

  @override
  State<StatefulWidget> createState() => _NoiseLoaderState();
}

class _NoiseLoaderState extends State<NoiseLoader>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Loading..."),
                const SizedBox(height: 16),
                CircularProgressIndicator(
                  value: controller.value,
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                ),
                const SizedBox(height: 16),
                Text("${(controller.value * 100).floor()}%"),
              ],
            )),
      ),
    );
  }
}
