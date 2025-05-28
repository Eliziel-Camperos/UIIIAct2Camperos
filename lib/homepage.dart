import 'package:flutter/material.dart';
import 'more_about_comic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> comicItems = [
    {
      "title": "Star Wars: Clone Wars Legends",
      "genre": "Sci-Fi / Acción",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics1.jpg",
      "releaseDate": "2003-12-05",
      "backgroundColor": Colors.deepPurple.shade100,
      "accentColor": Colors.deepPurple,
    },
    {
      "title": "Invincible Vol. 1",
      "genre": "Superhéroes / Drama",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics2.jpg",
      "releaseDate": "2003-01-22",
      "backgroundColor": Colors.grey.shade300,
      "accentColor": Colors.black,
    },
    {
      "title": "DC Variant Comics",
      "genre": "Superhéroes / Colección especial",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics3.jpg",
      "releaseDate": "2022-07-10",
      "backgroundColor": Colors.indigo.shade100,
      "accentColor": Colors.indigo,
    },
    {
      "title": "Steel Ball Run (JoJo Parte 7)",
      "genre": "Aventura / Fantasía / Carreras",
      "imageUrl":
          "https://raw.githubusercontent.com/Eliziel-Camperos/imagesGOD/main/comics4.jpg",
      "releaseDate": "2004-01-19",
      "backgroundColor": Colors.teal.shade100,
      "accentColor": Colors.teal,
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.science, "label": "Sci-Fi"},
    {"icon": Icons.flash_on, "label": "Acción"},
    {"icon": Icons.star, "label": "Superhéroes"},
    {"icon": Icons.auto_stories, "label": "Aventura"},
  ];

  String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    final filteredComics = comicItems.where((comic) {
      final title = comic['title'].toString().toLowerCase();
      final genre = comic['genre'].toString().toLowerCase();
      return title.contains(searchTerm.toLowerCase()) ||
          genre.contains(searchTerm.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Elige tu Cómic"),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.deepPurple),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Buscar cómic o género",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text("Categorías",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(category['icon'], size: 32, color: Colors.deepPurple),
                      const SizedBox(height: 8),
                      Text(category['label'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text("Cómics disponibles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: filteredComics.isEmpty
                ? const Center(child: Text("No se encontraron cómics."))
                : ListView.builder(
                    itemCount: filteredComics.length,
                    itemBuilder: (context, index) {
                      final comic = filteredComics[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ComicDetail(comic: comic),
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: comic['backgroundColor'],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20)),
                                child: Image.network(
                                  comic['imageUrl'],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(comic['title'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 4),
                                      Text(comic['genre'],
                                          style: TextStyle(
                                              color: comic['accentColor'],
                                              fontSize: 14)),
                                      const SizedBox(height: 4),
                                      Text("Lanzado: ${comic['releaseDate']}",
                                          style:
                                              const TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
