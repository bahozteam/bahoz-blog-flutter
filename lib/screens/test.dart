import 'package:flutter/material.dart';

///
/// This file is used to TEST new features
///

class MyTests extends StatefulWidget {
  const MyTests({super.key});

  @override
  State<MyTests> createState() => _MyTestsState();
}

class _MyTestsState extends State<MyTests> {
  double kheight = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: (() {}),
          child: Text('Button!'),
        ),
      ),
    );
  }
}
