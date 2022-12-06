import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _exPath = [];

  get ExternalPath => null;

  @override
  void initState() {
    super.initState();

    getPath();

    getPublicDirectoryPath();
  }
  Future<void> getPath() async {
    List<String> paths;

    paths = await ExternalPath.getExternalStorageDirectories();

    setState(() {
      _exPath = paths;
    });
  }

  Future<void> getPublicDirectoryPath() async {
    String path;

    path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);

    setState(() {
      print(path);
    });
  }
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
        title: const Text('Plugin example app'),
    ),
    body: ListView.builder(
      itemCount: _exPath.length,
      itemBuilder: (context, index) {
        return Center(child:
    Text("${_exPath[index]}"));
      }),
    ));
  }
}