import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Picker extends StatefulWidget {
  const Picker({super.key});

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  DateTime? selectedDate;
  File? selectedFile;
  Future<void> datePick() async {
    final DateTime? _datepick = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (_datepick != null && _datepick != selectedDate) {
      setState(() {
        selectedDate = _datepick;
      });
    }
  }
  
  Future<void> imagePick () async{
    final ImagePicker _imagePick = ImagePicker();
    final XFile? file = await _imagePick.pickImage(source: ImageSource.gallery);
    if(file != null){
      setState(() {
        selectedFile= File(file.path);
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  datePick();
                },
                child: Row(
                  children: [
                    Icon(Icons.calendar_view_day_rounded),
                    Text("select a date")
                  ],
                )),
          ),
          Text("no date selected"),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  imagePick();
                },
                child: Row(
                  children: [
                    Icon(Icons.camera_sharp),
                    Text("select a picture")
                  ],
                )),
          ),
          Text("no image selected"),
        ],
      ),
    );
  }
}
