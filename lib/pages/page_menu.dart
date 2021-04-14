import 'package:flutter/material.dart';
import 'package:muslim_apps/pages/doa/page_doa.dart';
import 'package:muslim_apps/pages/jadwal.dart';
import 'package:muslim_apps/pages/dzikir_page.dart';
import 'package:muslim_apps/pages/page_asmaulhusna.dart';
import 'package:muslim_apps/pages/page_main.dart';
import 'package:muslim_apps/pages/quran/image_slideshow.dart';
import 'package:muslim_apps/pages/qiblat/qiblat_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:muslim_apps/pages/renungan/model/renungan.dart';
import 'package:muslim_apps/pages/renungan/provider/renungan_provider.dart';
import 'package:muslim_apps/pages/renungan/widget/renungan_item.dart';
import 'package:muslim_apps/theme.dart';
import 'package:muslim_apps/widget/berita_item.dart';
import 'package:muslim_apps/widget/menu_item.dart';
import 'package:muslim_apps/model/berita.dart';
import 'package:provider/provider.dart';
import 'package:muslim_apps/providers/berita_provider.dart';
import 'package:muslim_apps/pages/ceramah/page_ceramah.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var renunganProvider = Provider.of<RenunganProvider>(context);
    renunganProvider.getRenungan();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff29286C),
                Color(0xffE69ED8),
              ],
            ),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ImageSlide(),
                    // width: double.infinity,
                    // child: Image.asset(
                    //   'assets/logo1.png',
                    //   width: 300,
                    // ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuItem(
                          onTapAction: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) {
                                  return PageMain();
                                },
                              ),
                            );
                          },
                          image: 'assets/quran.png',
                          title: 'Al-Qur\'an',
                        ),
                        MenuItem(
                          onTapAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageJadwal(),
                              ),
                            );
                          },
                          image: 'assets/praying.png',
                          title: 'Jadwal\nSholat',
                        ),
                        MenuItem(
                          onTapAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageDzikir(),
                              ),
                            );
                          },
                          image: 'assets/muslim.png',
                          title: 'Dzikir',
                        ),
                        MenuItem(
                          onTapAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageAsmaulHusna(),
                              ),
                            );
                          },
                          image: 'assets/bismillah.png',
                          title: 'Asmaul\nHusna',
                        ),
                      ],
                    ),
                  ),
                  // Menu Kedua
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuItem(
                          onTapAction: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) {
                                  return PageQiblat();
                                },
                              ),
                            );
                          },
                          image: 'assets/mecca.png',
                          title: 'Qiblat',
                        ),
                        MenuItem(
                          onTapAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageDoa(),
                              ),
                            );
                          },
                          image: 'assets/pray.png',
                          title: 'Doa Harian',
                        ),
                        MenuItem(
                          onTapAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageDzikir(),
                              ),
                            );
                          },
                          image: 'assets/mosque.png',
                          title: 'Khazanah',
                        ),
                        MenuItem(
                          onTapAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageCeramah(),
                              ),
                            );
                          },
                          image: 'assets/man.png',
                          title: 'Ceramah',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Renungan title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Text(
                      "Renungan..",
                      style: whiteTextStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  // Renungan Body
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: edge,
                    ),
                    child: FutureBuilder(
                      future: renunganProvider.getRenungan(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Renungan> data = snapshot.data;
                          int index = 0;
                          return Column(
                            children: data.map((item) {
                              return Container(
                                height: 400,

                                margin: EdgeInsets.only(top: 20),
                                // margin: EdgeInsets.only(
                                //   top: index == 1 ? 0 : 15,
                                // ),
                                child: RenunganItem(item),
                              );
                            }).toList(),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
