import 'package:flutter/material.dart';
import 'package:flutter_hm2/ui/my_dog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyDogPage());
  }
}