import 'package:flutter/material.dart';
import 'package:muslim_apps/model/berita.dart';
import 'package:muslim_apps/pages/page_menu.dart';

class BeritaItem extends StatelessWidget {
  final Berita berita;
  BeritaItem(this.berita);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(berita.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 190,
                  width: 380,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
