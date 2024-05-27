import 'package:flutter/material.dart';

class ExBluePage extends StatelessWidget {
  const ExBluePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}