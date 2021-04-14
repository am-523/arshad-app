import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:muslim_apps/theme.dart';

class JadwalItem extends StatelessWidget {
  final String icon;
  final String title;
  final String waktu;
  JadwalItem({this.icon, this.title, this.waktu});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 70,
        width: 330,
        color: whiteColor,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Lottie.network(
              '$icon',
              width: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                '$title',
                style: mediaumTextStyle.copyWith(fontSize: 20),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                '$waktu',
                style: mediaumTextStyle.copyWith(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
