import 'package:flutter/material.dart';
import 'package:muslim_apps/pages/models/asmaulhusna.dart';
import 'package:muslim_apps/pages/page_menu.dart';
import 'package:muslim_apps/theme.dart';

class PageAsmaulHusna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff29286C),
        centerTitle: true,
        elevation: 0,
        title: Text("Asmaul Husna"),
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
          child: ListView.builder(
            itemCount: asmaArab.length,
            itemBuilder: (BuildContext context, int position) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3.0,
                  child: ListTile(
                    onTap: () {},
                    title: Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text(
                        asmaArab[position],
                        textAlign: TextAlign.center,
                        style: regularTextStyle,
                      ),
                    ),
                    subtitle: Text(
                      asmaArti[position],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
