import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(key),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(Key key) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fileContent='';


  void readData() async {
    PermissionHandler().requestPermissions([PermissionGroup.storage]);
    final file = File('/storage/emulated/0/Download/hello.txt');
    String body = await file.readAsString();
    fileContent = body;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(fileContent),
            ElevatedButton(
              onPressed: readData,
              child: Text('Read File'),
            ),
          ],
        ),
      ),
    );
  }
}
