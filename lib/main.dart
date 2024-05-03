// main.dart

import 'package:flutter/material.dart';
import 'data_models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AlbumListScreen(),
    );
  }
}

class AlbumListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(albums.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoListScreen(album: albums[index]),
                ),
              );
            },
            child: Card(
              child: Center(
                child: Text(albums[index].name),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class PhotoListScreen extends StatelessWidget {
  final Album album;

  PhotoListScreen({required this.album});

  @override
  Widget build(BuildContext context) {
    List<Photo> albumPhotos = photos; // Filter photos by album name if needed

    return Scaffold(
      appBar: AppBar(
        title: Text(album.name),
      ),
      body: ListView.builder(
        itemCount: albumPhotos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailScreen(photo: albumPhotos[index]),
                ),
              );
            },
            child: ListTile(
              leading: Image.asset(
                albumPhotos[index].imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(albumPhotos[index].title),
              subtitle: Text(albumPhotos[index].description),
            ),
          );
        },
      ),
    );
  }
}

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  PhotoDetailScreen({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              photo.imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              photo.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(photo.description),
          ],
        ),
      ),
    );
  }
}
