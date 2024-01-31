import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_example/constants.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_example/select_crop.dart';
import 'package:tflite_example/tflite_magager/classifier.dart';

class Soyabean extends StatefulWidget {
  const Soyabean({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => SoyabeanState();
}

class SoyabeanState extends State<Soyabean> {
  XFile? _myImage;
  String _detectedImage = "Undefined!";
  late Classifier _classifier;
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    final classifier = await Classifier.loadWith(
      labelsFileName: soyabeanLabel,
      modelFileName: soyabeanModel,
    );

    setState(() {
      _classifier = classifier!;
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (file != null) _myImage = file;
    });
  }

  Future<void> _detectImage() async {
    _setDetecting(true);

    File image = File(_myImage!.path);

    final imageInput = img.decodeImage(image.readAsBytesSync())!;

    final resultCategory = _classifier.predict(imageInput);

    final result = resultCategory.score >= 0.8
        ? setLabel("Image Found!")
        : setLabel("Image Not Found!");
    final plantLabel = resultCategory.label;
    // final accuracy = resultCategory.score;

    setLabel(plantLabel);
    _setDetecting(false);
  }

  void setLabel(String label) {
    setState(() {
      _detectedImage = label;
    });
  }

  void _setDetecting(bool status) {
    setState(() {
      _isDetecting = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SelectCrop()),
            );
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color.fromRGBO(239, 231, 214, 1.0),
        ),
        elevation: 0,
        toolbarHeight: 60, title: const Text(
        "Scan Crop",
        style: TextStyle(
            fontSize: 28,
            color: Color.fromRGBO(239, 231, 214, 1.0)),
      ),
        backgroundColor: const Color.fromRGBO(89, 126, 82,1),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (_myImage != null)
                    ? Image.file(File(_myImage!.path), width: 200)
                    : const SizedBox(),
                const SizedBox(height: 40),
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(89, 126, 82,1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _pickImage();
                      },
                      child: const Text("Gallery",
                          style: TextStyle(fontSize: 18))),
                ),

                const SizedBox(height: 40),
                SizedBox(
                  height: 70,
                  width: 160,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(198, 169, 105,1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _detectImage();
                      },
                      child: const Text("Detect Image",
                          style: TextStyle(fontSize: 20))),
                ),
                const SizedBox(height: 40),
                Text(_detectedImage,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            (_isDetecting)
                ? const Center(
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator()),
            )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
