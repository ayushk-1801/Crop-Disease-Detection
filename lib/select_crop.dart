import 'package:flutter/material.dart';
import 'package:tflite_example/crop_cards.dart';

class SelectCrop extends StatefulWidget {
  const SelectCrop({super.key});

  @override
  State<SelectCrop> createState() => _SelectCropState();
}

class _SelectCropState extends State<SelectCrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
          "Select Crop",
          style: TextStyle(
              fontSize: 28,
              color: Color.fromRGBO(239, 231, 214, 1.0)),
        ),
        backgroundColor: const Color.fromRGBO(89, 126, 82,1),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          // top: 15,
                        ),
                        child: SelectCropCard(name: "Apple")),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Coffee"))
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Cotton")),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Groundnut"))
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Maizecorn")),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Rice"))
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Soyabean")),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Sugarcane"))
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: SelectCropCard(name: "Wheat")),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
