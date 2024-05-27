import 'package:flutter/material.dart';

class ExRedPage extends StatelessWidget {
  const ExRedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}