import 'package:flutter/material.dart';

class NilaiSiswaScreen extends StatefulWidget {
  @override
  _NilaiSiswaScreenState createState() => _NilaiSiswaScreenState();
}

class _NilaiSiswaScreenState extends State<NilaiSiswaScreen> {
  final TextEditingController _controller = TextEditingController();
  String _kategori = '';
  String _errorMessage = '';

  void _hitungKategori() {
    setState(() {
      _kategori = '';
      _errorMessage = '';

      // Validasi input
      final nilai = int.tryParse(_controller.text);
      if (nilai == null || nilai < 0 || nilai > 100) {
        _errorMessage = 'Masukkan nilai yang valid (0-100).';
        return;
      }

      // Pengelompokan nilai
      if (nilai >= 85) {
        _kategori = 'Kategori: A';
      } else if (nilai >= 70) {
        _kategori = 'Kategori: B';
      } else if (nilai >= 55) {
        _kategori = 'Kategori: C';
      } else {
        _kategori = 'Kategori: D';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa (0-100)',
                errorText: _errorMessage.isEmpty ? null : _errorMessage,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungKategori,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text(
              _kategori,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
