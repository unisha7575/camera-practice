import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({Key? key}) : super(key: key);

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          XFile? pickedImage = await _picker.pickImage(
              source: ImageSource.camera);
          setState(() {
            image = File(pickedImage!.path);
          });
        }, child: Text("camera"),),
   body: image==null? Text("there is no image"):
       Image.file(
         image!,
         height: 200,
         width: 200,)
    );
  }

}
