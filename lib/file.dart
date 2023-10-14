import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart'; 

import 'func.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> with Func {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.pushNamed(context, '/mylists');
    } else if (_selectedIndex == 1) {
      Navigator.pushNamed(context, '/recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "File upload",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    print(result?.files.single.path);
                    if (result != null) {
                      File file = File(result.files.single.path!);

                      fileUpload(file);
                    } else {
                      // User canceled the picker
                    }
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text(
                    "Click to upload file",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const Text(
              "My Files",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.file_copy),
                title: Text("File name"),
                trailing: Icon(Icons.arrow_right_alt_outlined),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.file_copy),
                title: Text("File name"),
                trailing: Icon(Icons.arrow_right_alt_outlined),
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Recipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download_sharp),
            label: 'Files',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
