import 'package:flutter/material.dart';
import 'package:muslim_apps/pages/page_menu.dart';
import 'package:muslim_apps/theme.dart';
import 'package:muslim_apps/widget/dzikir_item.dart';
import 'package:muslim_apps/pages/dzikir/dzikirpagi_page.dart';
import 'package:muslim_apps/pages/dzikir/dzikirpetang_page.dart';
import 'package:lottie/lottie.dart';

class PageDzikir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dzikir"),
        elevation: 0,
        backgroundColor: Color(0xff29286C),
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardMenu(
                        onTapAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TampilanPagi()));
                          //openNewSreen(context, TampilanPagi());
                        },
                        imgUrl:
                            "https://assets4.lottiefiles.com/packages/lf20_CAHmKs.json",
                        judul: "Pagi"),
                    CardMenu(
                        onTapAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TampilanPetang()));
                          // openNewSreen(context, TampilanPetang());
                        },
                        imgUrl:
                            "https://assets7.lottiefiles.com/packages/lf20_Ck4ANs.json",
                        judul: "Petang")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
