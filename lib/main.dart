import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranco/ui/home_page.dart';

void main() {
  runApp(const Ranco());
}

class Ranco extends StatelessWidget {
  const Ranco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ranco',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

