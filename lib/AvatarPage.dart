import 'dart:io';
import 'PopUp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'Data.dart';

class MyAvatarPage extends StatefulWidget {
  const MyAvatarPage({super.key});

  @override
  State<MyAvatarPage> createState() => _MyAvatarPageState();
}

class _MyAvatarPageState extends State<MyAvatarPage> {
  Uint8List? _pickImage;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 167, 248),
      body: Stack(
        alignment: Alignment(0, -0.3),
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-photo/anime-style-clouds_23-2151071749.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 10, 155, 204).withOpacity(0.35),
          ),
          Positioned(
            top: 240,
            child: Column(
              children: [
                Text(
                  "Choose or Update Avatar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 15),
                _pickImage != null
                    ? CircleAvatar(
                        radius: 100,
                        child: ClipOval(
                          child: Image.memory(
                            _pickImage!,
                            fit: BoxFit.cover,
                            width: 300,
                            height: 200,
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 100,
                        child: Icon(
                          Icons.account_circle,
                          size: 200,
                        ),
                      ),
              ],
            ),
          ),
          Positioned(
            bottom: 530,
            right: 115,
            child: CircleAvatar(
              radius: 33,
              child: IconButton(
                onPressed: () {
                  pickImage1(context);
                },
                icon: Icon(
                  Icons.photo_camera,
                  size: 50,
                  color: const Color.fromARGB(255, 30, 31, 31),
                ),
              ),
            ),
          ),
          Positioned(
              top: 520,
              child: ElevatedButton(
                  onPressed: () {
                    // lsUsers[userID].profileImage=_pickImage;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Poppage())
                    );
                  },
                  child: Text(
                    'Set As Profile Image',
                    style: TextStyle(fontSize: 18),
                  )))
        ],
      ),
    );
  }

  void pickImage1(BuildContext Context) {
    showModalBottomSheet(
        context: Context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose an option'),
            content: Column(
              children: [
                ListTile(
                  title: Text('Choose from gallery'),
                  onTap: () {
                    _pickImageFromGallery();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Take a new photo'),
                  onTap: () {
                    _pickImageFromCamera();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Choose from predefined images'),
                  onTap: () {
                    Navigator.pop(context);
                    _showPredefinedAvatars();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return null;
    setState(() {
      selectedImage = File(returnImage.path);
      _pickImage = File(returnImage.path).readAsBytesSync();
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return null;
    setState(() {
      selectedImage = File(returnImage.path);
      _pickImage = File(returnImage.path).readAsBytesSync();
    });
  }

  void _showPredefinedAvatars() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose an avatar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(predefinedAvatars.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(predefinedAvatars[index]),
                  title: Text('Avatar ${index + 1}'),
                  onTap: () {
                    _pickPredefinedAvatar(predefinedAvatars[index]);
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }

  Future<Uint8List> _fetchImageBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }

  void _pickPredefinedAvatar(String imageUrl) async {
    try {
      final bytes = await _fetchImageBytes(imageUrl);
      setState(() {
        _pickImage = bytes;
      });
    } catch (e) {
      print('Error fetching image: $e');
    }
  }
}