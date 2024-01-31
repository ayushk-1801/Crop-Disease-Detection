import 'package:flutter/material.dart';
import 'package:tflite_example/select_crop.dart';

class Namaste extends StatefulWidget {
  const Namaste({super.key});

  @override
  State<Namaste> createState() => _NamasteState();
}

class _NamasteState extends State<Namaste> {
  @override
  Widget build(BuildContext context) {




    final border = TextButton.styleFrom(
      elevation: 5,
      backgroundColor: const Color.fromRGBO(129, 201, 85, 1),
      foregroundColor: Colors.black,
      minimumSize: const Size(double.infinity, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: const Color.fromRGBO(242, 249, 241, 1),
        title: const Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            "NAMASKAR",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(56, 142, 60, 1)),
          ),
        ),
        //remove nav buttons
        //padding

        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 70, 80, 0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectCrop()),
                  );
                },
                style: border,
                child: const Text(
                  "English",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
