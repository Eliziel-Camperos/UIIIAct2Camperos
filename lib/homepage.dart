import 'package:flutter/material.dart';
import 'more_about_comic.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> comicItems = [
    {
      "title": "Star Wars: Clone Wars Legends",
      "genre": "Sci-Fi / Acción",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics1.jpg",
      "description":
          "Una recopilación de historias épicas del universo Star Wars, centradas en la antigua continuidad de las Guerras Clon.",
      "releaseDate": "2003-12-05",
      "backgroundColor": Colors.deepPurple.shade100,
      "accentColor": Colors.deepPurple,
    },
    {
      "title": "Invincible Vol. 1",
      "genre": "Superhéroes / Drama",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics2.jpg",
      "description":
          "Mark Grayson parece un chico normal... hasta que desarrolla superpoderes y descubre la verdad sobre su padre.",
      "releaseDate": "2003-01-22",
      "backgroundColor": Colors.grey.shade300,
      "accentColor": Colors.black,
    },
    {
      "title": "DC Variant Comics",
      "genre": "Superhéroes / Colección especial",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics3.jpg",
      "description":
          "Una colección visual de portadas variantes de DC Comics, celebrando el arte y el estilo único de cada personaje icónico.",
      "releaseDate": "2022-07-10",
      "backgroundColor": Colors.indigo.shade100,
      "accentColor": Colors.indigo,
    },
    {
      "title": "Steel Ball Run (JoJo Parte 7)",
      "genre": "Aventura / Fantasía / Carreras",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics4.jpg",
      "description":
          "En una carrera a través de América del siglo XIX, Johnny Joestar y Gyro Zeppeli enfrentan desafíos imposibles por un poder legendario.",
      "releaseDate": "2004-01-19",
      "backgroundColor": Colors.teal.shade100,
      "accentColor": Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Cómics Destacados"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: comicItems.length,
        itemBuilder: (context, index) {
          final comic = comicItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ComicDetail(comic: comic),
              ));
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: comic['backgroundColor'],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      comic['imageUrl'],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comic['title'],
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        Text(comic['genre'],
                            style: TextStyle(
                                color: comic['accentColor'], fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
