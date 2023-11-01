import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserAvatarCard extends StatefulWidget {
  final String? userEmail;

  UserAvatarCard({this.userEmail});

  @override
  _UserAvatarCardState createState() => _UserAvatarCardState();
}

class _UserAvatarCardState extends State<UserAvatarCard> {
  File? _userImage; // Store the selected user image

  Future<void> _pickUserImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _userImage = File(pickedImage.path);
      });
    }
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Profile Picture'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Pick from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickUserImage();
                },
              ),
              // Add more options for changing the profile picture, e.g., from camera, etc.
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _showImagePickerDialog, // Open the image picker dialog when the card is tapped
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          leading: CircleAvatar(
            backgroundImage: _userImage != null
                ? Image.file(_userImage!).image // Cast _userImage to ImageProvider
                : AssetImage('assets/User_icon.png'),
            radius: 35,
          ),
          title: Text(widget.userEmail ?? 'User Email'),
          subtitle: Text("Admin"),
        ),
      ),
    );
  }
}
