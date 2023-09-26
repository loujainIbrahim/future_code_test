import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:io';
class MyImage extends StatelessWidget {
  final String imageUrl;

  MyImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: _loadImage(),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error loading image: ${snapshot.error}');
          } else {
            return Image.file(snapshot.data!);
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<File> _loadImage() async {
    final encodedImageUrl = Uri.encodeComponent(imageUrl);
    final uri = Uri.parse('file:///$encodedImageUrl');
    final response = await http.get(uri);
    final bytes = response.bodyBytes;
    final file = File(imageUrl);
    await file.writeAsBytes(bytes);
    return file;
  }
}
