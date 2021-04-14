class Renungan {
  String imageUrl;
  String urlVideo;

  Renungan({this.imageUrl, this.urlVideo});

  Renungan.fromJson(json) {
    imageUrl = json['imageUrl'];
    urlVideo = json['urlVideo'];
  }
}
