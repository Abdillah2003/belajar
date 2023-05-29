import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BeritaNasionalPage extends StatefulWidget {
  @override
  _BeritaNasionalPageState createState() => _BeritaNasionalPageState();
}

class _BeritaNasionalPageState extends State<BeritaNasionalPage> {
  List<dynamic> beritaList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String url = 'https://api-berita-indonesia.vercel.app/cnn/nasional';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        beritaList = data['data']['posts'];
      });
    }
  }

  void navigateToDetailBerita(dynamic berita) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailBeritaPage(berita: berita),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Nasional'),
      ),
      body: ListView.builder(
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          var berita = beritaList[index];
          return Card(
            child: ListTile(
              leading: Image.network(berita['thumbnail']),
              title: Text(berita['title']),
              subtitle: Text(berita['description']),
              onTap: () {
                navigateToDetailBerita(berita);
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailBeritaPage extends StatelessWidget {
  final dynamic berita;

  const DetailBeritaPage({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Berita Nasional'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              berita['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.network(berita['thumbnail']),
            SizedBox(height: 16),
            Text(
              berita['description'],
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
