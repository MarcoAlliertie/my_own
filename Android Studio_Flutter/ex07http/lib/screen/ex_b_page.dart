import 'package:flutter/material.dart';

class ExBPage extends StatefulWidget {
  const ExBPage({super.key});

  @override
  State<ExBPage> createState() => _ExBPageState();
}

class _ExBPageState extends State<ExBPage> {
  @override
  void initState() {
    print('B페이지 init');
  }

  @override
  void dispose() {
    print('B페이지 dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){}, child: Text('A페이지로 이동')),
      ),
    );
  }
}
