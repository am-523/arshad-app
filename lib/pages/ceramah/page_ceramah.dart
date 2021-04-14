import 'package:flutter/material.dart';
import 'package:muslim_apps/model/berita.dart';
import 'package:muslim_apps/pages/page_menu.dart';
import 'package:muslim_apps/theme.dart';
import 'package:muslim_apps/widget/berita_item.dart';
import 'package:provider/provider.dart';
import 'package:muslim_apps/providers/berita_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PageCeramah extends StatefulWidget {
  final Berita berita;
  PageCeramah({this.berita});

  @override
  _PageCeramahState createState() => _PageCeramahState();
}

class _PageCeramahState extends State<PageCeramah> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ceramah Pilihan"),
        elevation: 0,
        backgroundColor: Color(0xff29286C),
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          },
          child: Icon(Icons.arrow_back // add custom icons also
              ),
        ),
      ),
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Berbagai Manfaat yang Akan Kita Dapat\nDari Mendengarkan Ceramah Agama.",
                      style: whiteTextStyle.copyWith(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Yuk, kita mulai perubahan mulai hari ini dengan kegiatan -\nkegiatan yang bisa menambah keilmuan kita.",
                      style: greyTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: FutureBuilder(
                  future: beritaProvider.getBerita(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Berita> data = snapshot.data;
                      int index = 0;
                      return Column(
                        children: data.map((item) {
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 15,
                            ),
                            child: InkWell(
                              onTap: () {
                                // launchURL(
                                //     "https://www.youtube.com/watch?v=5qap5aO4i9A");
                              },
                              child: BeritaItem(item),
                            ),
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
          ),
        ),
      ),
    );
  }
}
