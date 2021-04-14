import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackgroundImage extends StatelessWidget {
  final String imageUrl;

  BackgroundImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //         Colors.black.withOpacity(0.3), BlendMode.darken),

        //   ),
        // ),
        child: Lottie.network(imageUrl),
      ),
    );
  }
}
