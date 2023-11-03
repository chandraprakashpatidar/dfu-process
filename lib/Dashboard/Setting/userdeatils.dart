import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class UserDetailsPage extends StatefulWidget {
  final String? userEmail;
  final File? userImage;
  final String? subtitle;
  UserDetailsPage({this.userEmail, this.userImage, this.subtitle});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
bool _isPasswordVisible = false;
bool _isConfromPasswordVisible =false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController officialEmailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Container(   
          height: 800,
         // width: 350, 
        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/kk.jpg"),
      fit: BoxFit.fill, // Set the image to cover the entire container
    ),
  ),
  //  border: Border.all(
  //   //  color: Colors.red,  // Set the border color to red
  //     width: 2.0,         // Set the border width
  //   ),

          child: SingleChildScrollView(
            child: Column(
              children: [
            CircleAvatar(
                  backgroundImage: widget.userImage != null
                      ? FileImage(widget.userImage!)
                      : null,
                  radius: 50, // Adjust the size as needed
                ),
                Text(' ${widget.userEmail ?? 'N/A'}'),
                 Text('Role: ${widget.subtitle ?? 'N/A'}'),
                SizedBox(height: 40),
             Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: Row(
    children: [
    //SizedBox(width: 1),
      Expanded(
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Username",
            prefixIcon: Icon(Icons.person,color: Colors.white,),
            labelStyle: TextStyle(color: Colors.white), // Label text color
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // Border color
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // Focused border color
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  ),
),

                SizedBox(height: 10),
              Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: Row(
    children: [
    //SizedBox(width: 1),
      Expanded(
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.email,color: Colors.blue,),
            labelStyle: TextStyle(color: Colors.blue), // Label text color
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // Border color
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // Focused border color
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  ),
),
                SizedBox(height: 10),
                Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: Row(
    children: [
      Expanded(
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: !_isPasswordVisible, // Hide the password if _isPasswordVisible is false
          decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: Icon(Icons.lock, color: Colors.blue),
            labelStyle: TextStyle(color: Colors.blue),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ),
    ],
  ),
),
                SizedBox(height: 10),
                           Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: Row(
    children: [
      Expanded(
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: !_isPasswordVisible, // Hide the password if _isPasswordVisible is false
          decoration: InputDecoration(
            labelText: "ConfromPassword",
            prefixIcon: Icon(Icons.lock, color: Colors.blue),
            labelStyle: TextStyle(color: Colors.blue),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(_isConfromPasswordVisible ? Icons.visibility : Icons.visibility_off),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  _isConfromPasswordVisible = !_isConfromPasswordVisible;
                });
              },
            ),
          ),
        ),
      ),
    ],
  ),
),
                SizedBox(height: 10),
                Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: Row(
    children: [
    //SizedBox(width: 1),
      Expanded(
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Address",
            prefixIcon: Icon(Icons.location_on,color: Colors.blue,),
            labelStyle: TextStyle(color: Colors.blue), // Label text color
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // Border color
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // Focused border color
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  ),
),
SizedBox(height: 10),
Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Organization",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
      ),
      SizedBox(height: 5),
      TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.business, color: Colors.blue),
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ],
  ),
),

                SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 240,
                      child: ElevatedButton(
  onPressed: () {
    print("hello");
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
  },
  child: Text('Submit',style: TextStyle(color: Colors.blue),),
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set the background color to transparent
    elevation: MaterialStateProperty.all<double>(0), // Remove the elevation
    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0), // Set the border radius
      side: BorderSide(
        color: Colors.grey, // Set the border color
        width: 1.0, // Set the border width
      ),
    )),
    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
      color: Colors.black, // Set the text color
    )),
  ),
)
,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
