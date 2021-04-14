class ResponseSurat {
  String status;
  Query query;
  List<Hasil> hasil;

  ResponseSurat({this.status, this.query, this.hasil});

  ResponseSurat.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    if (json['hasil'] != null) {
      hasil = new List<Hasil>();
      json['hasil'].forEach((v) {
        hasil.add(new Hasil.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.query != null) {
      data['query'] = this.query.toJson();
    }
    if (this.hasil != null) {
      data['hasil'] = this.hasil.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Query {
  String format;
  String surat;
  Query({this.format, this.surat});

  Query.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    surat = json['surat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    data['surat'] = this.surat;
    return data;
  }
}

class Hasil {
  String nomor;
  String nama;
  String asma;
  String name;
  String start;
  String ayat;
  String type;
  String urut;
  String rukuk;
  String arti;
  String keterangan;

  Hasil(
      {this.nomor,
      this.nama,
      this.asma,
      this.name,
      this.start,
      this.ayat,
      this.type,
      this.urut,
      this.rukuk,
      this.arti,
      this.keterangan});

  Hasil.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    nama = json['nama'];
    asma = json['asma'];
    name = json['name'];
    start = json['start'];
    ayat = json['ayat'];
    type = json['type'];
    urut = json['urut'];
    rukuk = json['rukuk'];
    arti = json['arti'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['nama'] = this.nama;
    data['asma'] = this.asma;
    data['name'] = this.name;
    data['start'] = this.start;
    data['ayat'] = this.ayat;
    data['type'] = this.type;
    data['urut'] = this.urut;
    data['rukuk'] = this.rukuk;
    data['arti'] = this.arti;
    data['keterangan'] = this.keterangan;
    return data;
  }
}
