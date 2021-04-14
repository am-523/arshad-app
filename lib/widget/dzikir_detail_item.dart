import 'package:flutter/material.dart';
import 'package:muslim_apps/theme.dart';

class ItemDzikir extends StatelessWidget {
  String judul;
  String arab;
  String arti;

  ItemDzikir(this.judul, this.arab, this.arti);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          child: Text(
            judul,
            style: blackTextStyle,
          ),
        ),
        Divider(
          thickness: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          child: Text(
            arab,
            style: mediaumTextStyle,
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            arti,
            style: regularTextStyle,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
