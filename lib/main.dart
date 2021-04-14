import 'package:flutter/material.dart';

import 'package:muslim_apps/pages/page_splash.dart';
import 'package:muslim_apps/pages/renungan/provider/renungan_provider.dart';
import 'package:muslim_apps/providers/berita_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RenunganProvider(),
      child: ChangeNotifierProvider(
        create: (context) => BeritaProvider(),
        child: MaterialApp(
          home: PageSplash(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
