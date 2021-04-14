import 'dart:convert';
import 'package:intl/intl.dart';

class Status {
  static bool debug = false;
}

class Size {
  static double size4 = 4.0;
  static double size8 = 8.0;
  static double size12 = 12.0;
  static double size14 = 14.0;
  static double size16 = 16.0;
  static double size18 = 18.0;
  static double size20 = 20.0;
  static double size24 = 24.0;
  static double size32 = 32.0;
  static double size40 = 40.0;
  static double size64 = 64.0;
}

class Profil {
  static String nama = 'Moh. Basirudin';
  static String desc =
      'Ini adalah media saya untuk belajar. Silahkan kalau mau dikembangkan lagi agar bisa lebih baik dan lebih menarik. Silahkan untuk download file projeknya di Github. Terima kasih :)';
  static String instagram = 'Instagram';
  static String whatsapp = 'Whatsapp';
  static String facebook = 'Facebook';
  static String github = 'Github';
  static String urlInstagram = 'https://www.instagram.com/basirudin_/';
  static String urlWhatsapp = 'https://wa.me/6282332581431';
  static String urlFacebook = 'https://www.facebook.com/Moh.Basirudin.06';
  static String urlGithub = 'https://github.com/mohbasirudin/muslim_app';
}

class Data {
  static String suratID = 'suratID';
  static String totalAyat = 'ayat';
  static String suratNama = 'nama';
}

class Time {
  static String shubuh = 'Shubuh';
  static String dhuhur = 'Dhuhur';
  static String ashar = 'Ashar';
  static String maghrib = 'Maghrib';
  static String isya = 'Isya';
}

class Format {
  static String time_1 = 'dd MMM yyyy';
  static String time_2 = 'dd MMMM yyyy';
  static String time_3 = 'HH:mm';
  static String time_4 = 'yyyy-MM-dd';
}

class Func {
  static String convertUtf8(String data) {
    var varData = data.codeUnits;
    return utf8.decode(varData);
  }

  static String getTime(var format) {
    var date = DateTime.now();
    var f = DateFormat(format);
    return f.format(date);
  }

  static int timeToInt(String time) {
    List<String> listData = time.split(':');
    return (int.parse(listData[0]) * 60) + int.parse(listData[1]);
  }
}
