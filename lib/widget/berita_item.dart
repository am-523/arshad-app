import 'package:flutter/material.dart';
import 'package:muslim_apps/model/berita.dart';
import 'package:muslim_apps/pages/page_menu.dart';
import 'package:muslim_apps/providers/berita_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaItem extends StatefulWidget {
  final Berita berita;
  BeritaItem(this.berita);

  @override
  _BeritaItemState createState() => _BeritaItemState();
}

class _BeritaItemState extends State<BeritaItem> {
  @override
  Widget build(BuildContext context) {
    var beritaProvider = Provider.of<BeritaProvider>(context);
    beritaProvider.getBerita();

    launchURL(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(),
          ),
        );
      }
    }

    return InkWell(
      onTap: () {
        launchURL(widget.berita.urlVideo);
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
                      image: NetworkImage(widget.berita.imageUrl),
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
