import 'package:flutter/material.dart';
import 'package:muslim_apps/theme.dart';

class MenuItem extends StatelessWidget {
  final Function onTapAction;
  final String image;
  final String title;
  MenuItem({
    this.image,
    this.title,
    this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 80,
          width: 80,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  this.image,
                  width: 30,
                ),
              ),
              Text(this.title,
                  style: mediaumTextStyle, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
