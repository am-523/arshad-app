class Berita {
  String imageUrl;
  String urlVideo;

  Berita({this.imageUrl, this.urlVideo});

  Berita.fromJson(json) {
    imageUrl = json['imageUrl'];
    urlVideo = json['urlVideo'];
  }
}
