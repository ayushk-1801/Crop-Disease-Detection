import 'package:flutter/material.dart';
import 'package:tflite_example/coffee.dart';
import 'package:tflite_example/rice.dart';
import 'package:tflite_example/soyabean.dart';
import 'package:tflite_example/sugarcane.dart';
import 'package:tflite_example/wheat.dart';

import 'apple.dart';
import 'cotton.dart';
import 'groundnut.dart';
import 'maize.dart';

class SelectCropCard extends StatelessWidget {
  final String name;
  const SelectCropCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, String> image = {
      "Coffee": "assets/icons/coffee.png",
      "Cotton": "assets/icons/cotton.png",
      "Wheat": "assets/icons/wheat.png",
      "Apple": "assets/icons/apple.png",
      "Groundnut": "assets/icons/groundnut.png",
      "Maizecorn": "assets/icons/maizecorn.png",
      "Rice": "assets/icons/rice.png",
      "Soyabean": "assets/icons/soyabean.png",
      "Sugarcane": "assets/icons/sugarcane.png",
    };

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if(name=="Rice") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Rice()),
              );
            }
            if(name=="Apple") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Apple()),
              );
            }
            if(name=="Coffee") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Coffee()),
              );
            }
            if(name=="Cotton") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cotton()),
              );
            }
            if(name=="Groundnut") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Groundnut()),
              );
            }
            if(name=="Maizecorn") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Maize()),
              );
            }
            if(name=="Soyabean") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Soyabean()),
              );
            }
            if(name=="Sugarcane") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Sugarcane()),
              );
            }
            if(name=="Wheat") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Wheat()),
              );
            }


          },
          child: SizedBox(
            height: 190,
            width: 170,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        image[name]!,
                        height: 130,
                        width: 110,

                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(198, 169, 105,1),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
