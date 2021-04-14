import 'dart:convert';

ResponseAyat responseAyatFromJson(String str) => ResponseAyat.fromJson(json.decode(str));

String responseAyatToJson(ResponseAyat data) => json.encode(data.toJson());

class ResponseAyat {
    ResponseAyat({
        this.status,
        this.query,
        this.bahasa,
        this.surat,
        this.ayat,
    });

    String status;
    Query query;
    Bahasa bahasa;
    Surat surat;
    Ayat ayat;

    factory ResponseAyat.fromJson(Map<String, dynamic> json) => ResponseAyat(
        status: json["status"],
        query: Query.fromJson(json["query"]),
        bahasa: Bahasa.fromJson(json["bahasa"]),
        surat: Surat.fromJson(json["surat"]),
        ayat: Ayat.fromJson(json["ayat"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "query": query.toJson(),
        "bahasa": bahasa.toJson(),
        "surat": surat.toJson(),
        "ayat": ayat.toJson(),
    };
}

class Ayat {
    Ayat({
        this.proses,
        this.data,
    });

    List<int> proses;
    Data data;

    factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        proses: List<int>.from(json["proses"].map((x) => x)),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "proses": List<dynamic>.from(proses.map((x) => x)),
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.ar,
        this.idt,
        this.id,
    });

    List<Ar> ar;
    List<Ar> idt;
    List<Ar> id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ar: List<Ar>.from(json["ar"].map((x) => Ar.fromJson(x))),
        idt: List<Ar>.from(json["idt"].map((x) => Ar.fromJson(x))),
        id: List<Ar>.from(json["id"].map((x) => Ar.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ar": List<dynamic>.from(ar.map((x) => x.toJson())),
        "idt": List<dynamic>.from(idt.map((x) => x.toJson())),
        "id": List<dynamic>.from(id.map((x) => x.toJson())),
    };
}

class Ar {
    Ar({
        this.id,
        this.surat,
        this.ayat,
        this.teks,
    });

    Prose id;
    String surat;
    String ayat;
    String teks;

    factory Ar.fromJson(Map<String, dynamic> json) => Ar(
        id: proseValues.map[json["id"]],
        surat: json["surat"],
        ayat: json["ayat"],
        teks: json["teks"],
    );

    Map<String, dynamic> toJson() => {
        "id": proseValues.reverse[id],
        "surat": surat,
        "ayat": ayat,
        "teks": teks,
    };
}

enum Prose { AR, ID, IDT }

final proseValues = EnumValues({
    "ar": Prose.AR,
    "id": Prose.ID,
    "idt": Prose.IDT
});

class Bahasa {
    Bahasa({
        this.proses,
        this.keterangan,
    });

    List<Prose> proses;
    List<String> keterangan;

    factory Bahasa.fromJson(Map<String, dynamic> json) => Bahasa(
        proses: List<Prose>.from(json["proses"].map((x) => proseValues.map[x])),
        keterangan: List<String>.from(json["keterangan"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "proses": List<dynamic>.from(proses.map((x) => proseValues.reverse[x])),
        "keterangan": List<dynamic>.from(keterangan.map((x) => x)),
    };
}

class Query {
    Query({
        this.format,
        this.bahasa,
        this.bahasa2,
        this.surat,
        this.ayat,
        this.ayat2,
    });

    String format;
    String bahasa;
    List<Prose> bahasa2;
    String surat;
    String ayat;
    List<int> ayat2;

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        format: json["format"],
        bahasa: json["bahasa"],
        bahasa2: List<Prose>.from(json["bahasa2"].map((x) => proseValues.map[x])),
        surat: json["surat"],
        ayat: json["ayat"],
        ayat2: List<int>.from(json["ayat2"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "format": format,
        "bahasa": bahasa,
        "bahasa2": List<dynamic>.from(bahasa2.map((x) => proseValues.reverse[x])),
        "surat": surat,
        "ayat": ayat,
        "ayat2": List<dynamic>.from(ayat2.map((x) => x)),
    };
}

class Surat {
    Surat({
        this.nomor,
        this.nama,
        this.asma,
        this.name,
        this.start,
        this.ayat,
        this.type,
        this.urut,
        this.rukuk,
        this.arti,
        this.keterangan,
    });

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

    factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        nomor: json["nomor"],
        nama: json["nama"],
        asma: json["asma"],
        name: json["name"],
        start: json["start"],
        ayat: json["ayat"],
        type: json["type"],
        urut: json["urut"],
        rukuk: json["rukuk"],
        arti: json["arti"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "asma": asma,
        "name": name,
        "start": start,
        "ayat": ayat,
        "type": type,
        "urut": urut,
        "rukuk": rukuk,
        "arti": arti,
        "keterangan": keterangan,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
