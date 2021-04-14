class Berita {
  String imageUrl;

  Berita({this.imageUrl});

  Berita.fromJson(json) {
    imageUrl = json['imageUrl'];
  }
}
