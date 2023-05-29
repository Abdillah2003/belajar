import 'package:flutter/material.dart';
import 'terbaru.dart';
import 'olahraga.dart';
import 'teknologi.dart';
import 'nasional.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Utama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png',
              height: 100,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaTerbaruPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Terbaru'),
                ),
                SizedBox(width: 16), // Jarak antara dua tombol dalam satu baris
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaNasionalPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Nasional'),
                ),
              ],
            ),
            SizedBox(height: 16), // Jarak antara dua baris tombol
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaOlahragaPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Olahraga'),
                ),
                SizedBox(width: 16), // Jarak antara dua tombol dalam satu baris
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaTeknologiPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Teknologi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
