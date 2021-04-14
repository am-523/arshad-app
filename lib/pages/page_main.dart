import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslim_apps/api/api_service.dart';
import 'package:muslim_apps/api/api_url.dart';
import 'package:muslim_apps/baseurl/base_app.dart';
import 'package:muslim_apps/baseurl/base_asset.dart';
import 'package:muslim_apps/baseurl/base_style.dart';
import 'package:muslim_apps/helper/remove_glow.dart';
import 'package:muslim_apps/pages/models/quran/response_surat.dart';
import 'package:muslim_apps/pages/other/dialog_profil.dart';
import 'package:muslim_apps/pages/quran/paget_ayat.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'page_menu.dart';

class PageMain extends StatefulWidget {
  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  RefreshController _refreshCon = RefreshController();
  var _vTime = false, _pageLoading = true;
  var _curLocation = '',
      _latitude = '',
      _longitude = '',
      _curShalat = '',
      _curTimeShalat = '--:--',
      _curCity = '';
  var _appBarHeight = 0.0, _statusBarHeight = 0.0;
  var _shubuh = 0,
      _dhuhur = 0,
      _ashar = 0,
      _maghrib = 0,
      _isya = 0,
      _curTime = 0;

  final ApiService _apiService = ApiService();
  List<Hasil> listHasil = List();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future _getShalat() async {
    var urlShalat = '';
    await ApiUrl.jadwalShalat(ApiUrl.methodToday, _latitude, _longitude)
        .then((value) => urlShalat = value);
    _apiService.get(
        url: urlShalat,
        headers: {},
        callback: (status, message, response) {
          try {
            setState(() {
              // if (status) {
              //   shalat.ResponseShalat resShalat =
              //       shalat.ResponseShalat.fromJson(response);
              //   List<shalat.Datetime> listDatetime = resShalat.results.datetime;
              //   _curTime = Func.timeToInt(Func.getTime(Format.time_3));
              //   _shubuh = Func.timeToInt(listDatetime[0].times.fajr);
              //   _dhuhur = Func.timeToInt(listDatetime[0].times.dhuhr);
              //   _ashar = Func.timeToInt(listDatetime[0].times.asr);
              //   _maghrib = Func.timeToInt(listDatetime[0].times.maghrib);
              //   _isya = Func.timeToInt(listDatetime[0].times.isha);

              //   if (_curTime >= _shubuh && _curTime < _dhuhur) {
              //     _curShalat = Time.dhuhur;
              //     _curTimeShalat = listDatetime[0].times.dhuhr;
              //   } else if (_curTime >= _dhuhur && _curTime < _ashar) {
              //     _curShalat = Time.ashar;
              //     _curTimeShalat = listDatetime[0].times.asr;
              //   } else if (_curTime >= _ashar && _curTime < _maghrib) {
              //     _curShalat = Time.maghrib;
              //     _curTimeShalat = listDatetime[0].times.maghrib;
              //   } else if (_curTime >= _maghrib && _curTime < _isya) {
              //     _curShalat = Time.isya;
              //     _curTimeShalat = listDatetime[0].times.isha;
              //   } else {
              //     _curShalat = Time.shubuh;
              //     _curTimeShalat = listDatetime[0].times.fajr;
              //   }
              //   _vTime = true;
              //   if (_pageLoading) _getData();
              // }
            });
          } catch (e) {
            debugPrint(e.toString());
          }
        });
  }

  Future _getData() async {
    _refreshCon.refreshToIdle();
    await _apiService.get(
        url: ApiUrl.surat,
        headers: {},
        callback: (status, message, response) {
          setState(() {
            _refreshCon.refreshCompleted();
            _pageLoading = false;

            if (listHasil.isNotEmpty) listHasil.clear();
            if (status) {
              ResponseSurat resSurat = ResponseSurat.fromJson(response);
              listHasil = resSurat.hasil;
            }
          });
          return;
        });
  }

  @override
  Widget build(BuildContext context) {
    _statusBarHeight = MediaQuery.of(context).padding.top;
    _appBarHeight = AppBar().preferredSize.height;

    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: Status.debug,
      home: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, scrolling) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: Color(0xff29286C),
                pinned: true,
                expandedHeight: 260,
                forceElevated: scrolling,
                title: Text(
                  "Al-Quran",
                  style: TextStyle(color: Colors.white, fontSize: Size.size18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: GestureDetector(
                  onTap: () {
                    /* Write listener code here */
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuPage()));
                  },
                  child: Icon(Icons.arrow_back // add custom icons also
                      ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.sync,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _pageLoading = true;
                      });
                    },
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.account_circle,
                  //     color: Colors.white,
                  //   ),
                  //   onPressed: () => showDialog(
                  //       context: context, builder: (context) => DialogProfil()),
                  // ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.black),
                      foregroundDecoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(BaseAsset.bgPicturelogo),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: _appBarHeight + _statusBarHeight + Size.size24,
                          left: Size.size16,
                          right: Size.size16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   _curTimeShalat,
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 56,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // Visibility(
                          //   visible: _vTime,
                          //   child: Text(
                          //     'Menuju $_curShalat',
                          //     style: TextStyle(color: Colors.black),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: Size.size16,
                        left: Size.size16,
                        right: Size.size16,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   _curCity,
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: Size.size12,
                                //   ),
                                // ),
                                // Text(
                                //   Func.getTime(Format.time_2),
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: Size.size12,
                                //   ),
                                // ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(Size.size8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Size.size8))),
                              // child: Row(
                              //   children: [
                              //     Text(
                              //       'Detail',
                              //       style: TextStyle(
                              //           color: Colors.black,
                              //           fontSize: Size.size12),
                              //     ),
                              //     Container(
                              //         margin: EdgeInsets.only(left: 4),
                              //         child: Icon(
                              //           Icons.arrow_forward_ios,
                              //           color: Colors.grey[700],
                              //           size: Size.size12,
                              //         ))
                              //   ],
                              // ),
                            ),
                          ],
                        ))
                  ],
                )),
              ),
            ),
          ];
        },
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: _appBarHeight),
              child: ScrollConfiguration(
                behavior: RemoveGlow(),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: listHasil.length,
                  itemBuilder: (context, index) => itemSurat(listHasil, index),
                ),
              ),
            ),
            Center(
              child: Visibility(
                visible: _pageLoading,
                child: JumpingDotsProgressIndicator(
                  fontSize: Size.size40,
                  color: Color(0xff29286C),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget itemSurat(List<Hasil> listHasil, int index) {
    return Container(
      color: (index % 2 == 0) ? Colors.white : Colors.indigoAccent[50],
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            Map<String, dynamic> data = {
              Data.suratID: (index + 1).toString(),
              Data.totalAyat: listHasil[index].ayat,
              Data.suratNama: listHasil[index].nama
            };
            return PageAyat(data: data);
          }));
        },
        child: Container(
          margin: EdgeInsets.all(Size.size16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  styleText(listHasil[index].nama, Size.size24,
                      Color(0xff29286C), FontWeight.normal, 1, null),
                  styleText(
                      listHasil[index].arti +
                          ' | ' +
                          listHasil[index].ayat +
                          ' ayat',
                      Size.size18,
                      Colors.grey,
                      FontWeight.normal,
                      2,
                      null),
                ],
              ),
              Spacer(),
              Container(
                height: Size.size40,
                child: Image.asset(BaseAsset.imagesSurat[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
