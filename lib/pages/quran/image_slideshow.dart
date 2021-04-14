import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 300,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: [
        Image.network(
          'https://cdn.dribbble.com/users/1314508/screenshots/6470860/img_0457_4x.jpg?compress=1&resize=1000x750',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://cdn.dribbble.com/users/2497818/screenshots/13966124/media/05d4a9b0b025d6df38e794a31ed62cd7.jpg?compress=1&resize=1000x750',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://cdn.dribbble.com/users/7143678/screenshots/15463234/media/d266eb9494cf25a873882656e8b8cde5.jpg?compress=1&resize=1000x750',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://cdn.dribbble.com/users/2201557/screenshots/6282337/ramadan_is_coming.png?compress=1&resize=800x600',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://cdn.dribbble.com/users/2383726/screenshots/6162341/ramdhan_karim_4x.jpg?compress=1&resize=1000x750',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://cdn.dribbble.com/users/2424774/screenshots/11134555/01_marhaban_ya_ramadan_1x.png',
          fit: BoxFit.cover,
        ),
      ],
      onPageChanged: (value) {
        print('Page changed: $value');
      },
      autoPlayInterval: 3000,
    );
  }
}
