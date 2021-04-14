import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_apps/pages/models/quran/response_ayat.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:muslim_apps/api/api_service.dart';
import 'package:muslim_apps/api/api_url.dart';
import 'package:muslim_apps/baseurl/base_app.dart' as BaseApp;
import 'package:muslim_apps/helper/remove_glow.dart';

import 'package:muslim_apps/baseurl/base_app.dart';
import 'package:muslim_apps/pages/page_main.dart';

class PageAyat extends StatefulWidget {
  final Map<String, dynamic> data;
  const PageAyat({Key key, this.data}) : super(key: key);

  @override
  _PageAyatState createState() => _PageAyatState();
}

class _PageAyatState extends State<PageAyat> {
  var _data;
  var _url = '', _totalAyat = '', _suratNama = '';
  var _ayatStart = 1, _ayatEnd = 10;
  var _isLoading = false, _pageLoading = true, _reloadData = false;
  List<Ar> _listArab = new List(), _listIndo = new List();

  @override
  void initState() {
    _data = widget.data;
    _totalAyat = _data[BaseApp.Data.totalAyat];
    _suratNama = _data[BaseApp.Data.suratNama];
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: Status.debug,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff29286C),
          title: Text(
            _suratNama,
            style: TextStyle(fontSize: Size.size18, color: Colors.white),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => PageMain()))),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.sync,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _reloadData = true;
                    _getData();
                  });
                })
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Visibility(
                  visible: _reloadData,
                  child: Container(
                    margin: EdgeInsets.only(bottom: Size.size16),
                    child: JumpingDotsProgressIndicator(
                      fontSize: Size.size32,
                      color: Color(0xff29286C),
                    ),
                  ),
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollNotification) {
                      if (!_isLoading &&
                          scrollNotification.metrics.pixels ==
                              scrollNotification.metrics.maxScrollExtent) {
                        if (_listArab.length < int.parse(_totalAyat)) {
                          debugPrint('load');
                          _getData();
                          setState(() {
                            _isLoading = true;
                          });
                        }
                      }
                      return true;
                    },
                    child: ScrollConfiguration(
                      behavior: RemoveGlow(),
                      child: ListView.builder(
                        itemCount: _listArab.length,
                        itemBuilder: (context, index) =>
                            itemAyat(_listArab, _listIndo, index),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isLoading,
                  child: Container(
                    height: 48,
                    color: Colors.transparent,
                    child: Center(
                      child: JumpingDotsProgressIndicator(
                        fontSize: Size.size40,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: _pageLoading,
              child: Center(
                child: JumpingDotsProgressIndicator(
                  fontSize: Size.size40,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getData() async {
    await ApiUrl.ayatRange(_data[BaseApp.Data.suratID], _ayatStart, _ayatEnd)
        .then((value) => _url = value);

    ApiService().get(
        url: _url,
        callback: (status, message, response) {
          setState(() {
            if (status) {
              ResponseAyat resAyat =
                  ResponseAyat.fromJson(jsonDecode(json.encode(response)));
              _listArab.addAll(resAyat.ayat.data.ar);
              _listIndo.addAll(resAyat.ayat.data.id);
              _ayatStart = _ayatEnd + 1;
              _ayatEnd = _ayatEnd + 10;
              _isLoading = false;
              _pageLoading = false;
              _reloadData = false;
            }
          });
        });
  }

  Widget itemAyat(List<Ar> listArab, List<Ar> listIndo, var index) {
    return Container(
      color: (index % 2 == 1) ? Colors.white : Colors.grey[50],
      child: Container(
        margin: EdgeInsets.only(
          top: Size.size16,
          right: Size.size16,
          bottom: Size.size16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Size.size40,
              height: Size.size32,
              margin: EdgeInsets.only(right: Size.size16),
              decoration: BoxDecoration(
                  color: Color(0xff29286C),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(color: Colors.white, fontSize: Size.size18),
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text(
                      Func.convertUtf8(listArab[index].teks),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: Size.size24,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: BaseApp.Size.size8),
                    child: Text(
                      listIndo[index].teks,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: Size.size18,
                        color: Color(0xff29286C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
