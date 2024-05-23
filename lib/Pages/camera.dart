import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'MainPage.dart';

class CameraCapturePage extends StatefulWidget {
  const CameraCapturePage({super.key});

  @override
  _CameraCapturePageState createState() => _CameraCapturePageState();
}

class _CameraCapturePageState extends State<CameraCapturePage> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/BG.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imageFile == null
                    ? ElevatedButton(
                  onPressed: _pickImageFromCamera, // Change the icon to a camera icon
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.camera_alt, size: 50),
                )
                    : Image.file(_imageFile!),
                const SizedBox(height: 20),
                if (_imageFile != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _retakePhoto,
                        icon: const Icon(Icons.refresh),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    setState(() {
      _imageFile = File(pickedImage.path);
    });
  }

  void _retakePhoto() {
    setState(() {
      _imageFile = null;
    });
  }
}
