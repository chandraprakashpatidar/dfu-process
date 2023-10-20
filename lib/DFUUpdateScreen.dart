import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nordic_dfu/nordic_dfu.dart';
import 'dart:io';
import 'package:bbbb/HomePage.dart';

class DFUUpdateScreen extends StatefulWidget {
  final String deviceId;

  DFUUpdateScreen({required this.deviceId});

  @override
  _DFUUpdateScreenState createState() => _DFUUpdateScreenState();
}

class _DFUUpdateScreenState extends State<DFUUpdateScreen> {
  int dfuProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DFU Update'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Device ID: ${widget.deviceId}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          
            CircularProgressIndicator(
              value: dfuProgress / 100, // Normalize the progress to a range of 0.0 to 1.0
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            Text(
              'Progress: $dfuProgress%', // Display the progress percentage
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                startDFUUpdate(widget.deviceId);
              },
              child: Text('Start DFU Update'),
            ),
          ],
        ),
      ),
    );
  }

  // Implement your DFU update logic here
  void startDFUUpdate(String deviceId) async {
    try {
      print('Starting DFU update for device ID: $deviceId');

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip'],
      );

      if (result != null && result.files.isNotEmpty) {
        File file = File(result.files.single.path!);

        await NordicDfu().startDfu(
          deviceId,
          file.path,
          fileInAsset: false,
          onProgressChanged: (
            String deviceAddress,
            int percent,
            double speed,
            double avgSpeed,
            int currentPart,
            int totalParts,
          ) {
            setState(() {
              dfuProgress = percent; // Update the progress
            });
print("wwwwwwwwwwwwwwwwww,$percent");
            // Check if the DFU is completed
            if (percent >= 100) {
              showDFUCompletedDialog(context);
            }
          },
        );
      } else {
        // User canceled file selection
        print('File selection canceled');
      }
    } catch (e) {
      print('Error starting DFU update: $e');
    }
  }

  // Function to show a pop-up dialog when DFU is completed
  void showDFUCompletedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('DFU Update Completed'),
          content: Text('DFU update for device ID ${widget.deviceId} completed successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the current screen and navigate back to the Homepage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Replace with your HomePage screen
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
