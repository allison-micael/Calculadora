import 'package:flutter/material.dart';

import 'calculadora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 218, 160, 210),
        ),
        body: Column(
          children: [
            // Layout Superior
            Expanded(
              flex: 2,
              child: Container()
                ),
            // Seção Central
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  width: 250,
                  height: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 211, 211),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color.fromARGB(255, 218, 136, 55),
                      width: 3,
                    ),
                  ),
                  child: const Calculadora()
                  ),
                ),
              ),
            // Layout Inferior
            Expanded(
              flex: 2,
              child: Container()
                ),
          ],
        ),
      ),
    );
  }
}
