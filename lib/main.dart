import 'package:flutter/material.dart';
import 'package:ifood_clone/pages/ifood.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: IfoodPage(),
    );
  }
}
