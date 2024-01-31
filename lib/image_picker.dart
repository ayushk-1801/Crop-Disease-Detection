import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(home: ImagePickerApp()));
}

class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({super.key});

  @override
  State<ImagePickerApp> createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image as File?;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // Image.network(),
            CustomButton(
                title: "Pick from Gallery",
                icon: Icons.image_outlined,
                onClick: getImage,),
            const SizedBox(height: 20),
            CustomButton(
              title: "Pick from Camera",
              icon: Icons.camera,
              onClick: () => {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return SizedBox(
    width: 280,
    child: ElevatedButton(
      onPressed: () => {},
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    ),
  );
}
