import 'package:flutter/material.dart';
import 'home.dart';

void main(){
  runApp(const calc());
}

class calc extends StatelessWidget{
  const calc({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: HomePage(),
    );
  }
}