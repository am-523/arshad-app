import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_apps/pages/renungan/model/renungan.dart';

class RenunganProvider extends ChangeNotifier {
  getRenungan() async {
    String uri = "https://arshad-app.herokuapp.com/api/arshad-renungan";
    var result = await http.get(Uri.parse(uri));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Renungan> renungan =
          data.map((item) => Renungan.fromJson(item)).toList();
      return renungan;
    } else {
      return <Renungan>[];
    }
  }
}
