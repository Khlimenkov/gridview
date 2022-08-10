import 'package:flutter/material.dart';
import 'package:gridview/features/grid_view/ui/grid_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GridView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GridViewScreen(),
    );
  }
}
