import 'package:flutter/material.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.green,
                ),
              ),
              Positioned(
                 top: -50,
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 150,
                      width: 170,
                      color: Colors.red,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
