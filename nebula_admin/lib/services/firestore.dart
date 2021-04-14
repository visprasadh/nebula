import 'package:cloud_firestore/cloud_firestore.dart';

class AddWallpaper {
  final String name;
  final String photographer;
  final String category;
  final String url;

  CollectionReference wallpapers;

  AddWallpaper({
    this.name,
    this.photographer,
    this.category,
    this.url,
  }) {
    wallpapers = FirebaseFirestore.instance.collection(category);
  }

  Future<void> addWallpaper() => wallpapers
      .add({'name': name, 'photographer': photographer, 'url': url})
      .then((value) => print('Wallpaper added'))
      .catchError((error) => print('Failed to add wallpaper: $error'));
}
