import 'package:ex09image_picker/step/camera.dart';
import 'package:ex09image_picker/step/gallery.dart';
import 'package:ex09image_picker/step/send_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: ExSendImage(),
    );
  }
}
