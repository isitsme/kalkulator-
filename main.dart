import 'package:flutter/material.dart';
import 'nilai.dart'; // Import widget terpisah

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengelompokan Nilai Siswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NilaiSiswaScreen(),
    );
  }
}
