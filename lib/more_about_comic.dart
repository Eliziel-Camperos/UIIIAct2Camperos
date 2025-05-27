import 'package:flutter/material.dart';

class ComicDetail extends StatelessWidget {
  final Map<String, dynamic> comic;

  const ComicDetail({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: comic['backgroundColor'],
      appBar: AppBar(
        title: Text(comic['title']),
        backgroundColor: comic['accentColor'],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              comic['imageUrl'],
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic['title'],
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    comic['genre'],
                    style: TextStyle(fontSize: 18, color: comic['accentColor']),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "📅 Fecha de lanzamiento: ${comic['releaseDate']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "📝 Sinopsis:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    comic['description'],
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
