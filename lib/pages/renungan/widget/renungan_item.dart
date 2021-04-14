import 'package:flutter/material.dart';

import 'package:muslim_apps/pages/page_menu.dart';
import 'package:muslim_apps/pages/renungan/model/renungan.dart';
import 'package:muslim_apps/pages/renungan/provider/renungan_provider.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RenunganItem extends StatefulWidget {
  final Renungan renungan;
  RenunganItem(this.renungan);

  @override
  _RenunganItemState createState() => _RenunganItemState();
}

class _RenunganItemState extends State<RenunganItem> {
  @override
  Widget build(BuildContext context) {
    var renunganProvider = Provider.of<RenunganProvider>(context);
    renunganProvider.getRenungan();

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
        launchURL(widget.renungan.urlVideo);
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
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.renungan.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 400,
                    width: 380,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
