import 'package:flutter/material.dart';

class ExGreenPage extends StatelessWidget {
  const ExGreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}