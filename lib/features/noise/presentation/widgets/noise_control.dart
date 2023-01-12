// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:noisegenflutter/features/noise/presentation/cubit/noise_cubit.dart';

class NoiseControl extends StatefulWidget {
  const NoiseControl({super.key});

  @override
  State<NoiseControl> createState() => _NoiseControlState();
}

class _NoiseControlState extends State<NoiseControl> {
  final controller = TextEditingController();
  int _noiseAmount = 0;
  bool _isSubmitable = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CubitBuilder<NoiseCubit, NoiseState>(builder: (context, state) {
      return Scaffold(
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(48),
                child: Column(
                  children: [
                    Text(
                      'NOISEGEN',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Noisegen will try to generate noises based on your request. Please input the amount of noise that you want to be generated. Maximum number is 500. Your memory will blow if you exceed that number.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 32),
                    const Text('HOW MANY?'),
                    const SizedBox(height: 32),
                    TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          _noiseAmount = int.tryParse(value) ?? 0;
                          _isSubmitable = _noiseAmount != 0;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "69",
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.black45,
                                style: BorderStyle.solid)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.black87,
                                style: BorderStyle.solid)),
                      ),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    const SizedBox(height: 32),
                    _isSubmitable
                        ? OutlinedButton(
                            onPressed: () {
                              if (_isSubmitable) dispatchNoiseAmount(context);
                            },
                            child: const Text("Generate",
                                style: TextStyle(
                                    color: Colors.black,
                                    backgroundColor: Colors.transparent)))
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void dispatchNoiseAmount(BuildContext context) {
    controller.clear();
    context.cubit<NoiseCubit>().load(_noiseAmount);
  }
}
