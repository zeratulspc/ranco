import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranco/data/chords.dart';
import 'package:ranco/ui/home.dart';

void main() {
  runApp(const Ranco());
}

class Ranco extends StatelessWidget {
  const Ranco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

