import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lottie/lottie.dart';

import 'package:geolocator/geolocator.dart';
import 'package:muslim_apps/pages/models/prayer_time.dart';
import 'package:muslim_apps/theme.dart';
import 'package:muslim_apps/widget/jadwal_item.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'page_menu.dart';

class PageJadwal extends StatefulWidget {
  @override
  _PageJadwalState createState() => _PageJadwalState();
}

class _PageJadwalState extends State<PageJadwal> {
  List<String> gambar = [
    // "assets/subuh.png",
    // "assets/terbit.png",
    // "assets/zhur.png",
    // "assets/magrib.png",
    // "assets/sunset.png",
    // "assets/asr.png",
    // "assets/isyah.png"

    "https://assets10.lottiefiles.com/private_files/lf30_nx7kptft.json",
    "https://assets1.lottiefiles.com/temp/lf20_HflU56.json",
    "https://assets10.lottiefiles.com/private_files/lf30_moaf5wp5.json",
    "https://assets10.lottiefiles.com/private_files/lf30_rorwpi7j.json",
    "https://assets10.lottiefiles.com/private_files/lf30_ykkzuozu.json",
    "https://assets10.lottiefiles.com/private_files/lf30_5tzqguri.json",
    "https://assets10.lottiefiles.com/private_files/lf30_iugenddu.json"
  ];

  final Geolocator geolocator = Geolocator();
  Position userLocation;
  Placemark userAddress;

  double lat_value = -3.0149806;
  double long_value = 120.1649646;
  String address = "Kota Palopo";

  List<String> _prayerTimes = [];
  List<String> _prayerNames = [];
  List initData = [];

  @override
  void initState() {
    super.initState();

    getSP().then((value) {
      initData = value;
      getPrayerTimes(lat_value, long_value);
      getAddress(lat_value, long_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff29286C),
        centerTitle: true,
        elevation: 0,
        title: Text("Jadwal Sholat"),
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
            _getLocation().then((value) {
              setState(() {
                userLocation = value;
                getPrayerTimes(userLocation.latitude, userLocation.longitude);
                getAddress(userLocation.latitude, userLocation.longitude);
                address = " ${userAddress.subAdministrativeArea}"
                    ","
                    " ${userAddress.country} ";
              });

              setSP();
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
            child: Icon(Icons.arrow_back // add custom icons also
                ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.location_on // add custom icons also
                  ),
            ),
          ),
        ],
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
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: whiteColor,
                      ),
                      Text(
                        address ?? "Mencari lokasi ...",
                        style: whiteTextStyle.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  // Lottie.network(
                  //     'https://assets1.lottiefiles.com/temp/lf20_HflU56.json',
                  //     width: 60),
                  // FlatButton.icon(
                  //   onPressed: () {
                  //     _getLocation().then((value) {
                  //       setState(() {
                  //         userLocation = value;
                  //         getPrayerTimes(
                  //             userLocation.latitude, userLocation.longitude);
                  //         getAddress(userLocation.latitude, userLocation.longitude);
                  //         address = " ${userAddress.subAdministrativeArea} "
                  //             " ${userAddress.country} ";
                  //       });

                  //       setSP();
                  //     });
                  //   },
                  //   icon: Icon(
                  //     Icons.location_on,
                  //     color: Colors.white,
                  //   ),
                  //   label: Text(
                  //     address ?? "Mencari lokasi ...",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontFamily: 'Montserrat',
                  //         fontSize: 14),
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment.center,
                    child: Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_Zdbli1.json',
                      width: 260,
                      alignment: Alignment.center,
                    ),
                  ),

                  Container(
                      height: 370, //MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          itemCount: _prayerNames.length,
                          itemBuilder: (context, position) {
                            return Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Jadwal Sholat
                                    JadwalItem(
                                      icon: gambar[position],
                                      title: _prayerNames[position],
                                      waktu: _prayerTimes[position],
                                    ),
                                    //
                                    // Container(
                                    //   width: 120,
                                    //   child: Text(
                                    //     _prayerNames[position],
                                    //     style: TextStyle(
                                    //       color: Colors.white,
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(width: 10),
                                    // Container(
                                    //   width: 150,
                                    //   decoration: BoxDecoration(
                                    //     borderRadius:
                                    //         BorderRadius.all(Radius.circular(5)),
                                    //     color: Colors.teal[50],
                                    //   ),
                                    //   child: Text(
                                    //     _prayerTimes[position],
                                    //     style: TextStyle(
                                    //         color: Colors.teal,
                                    //         fontSize: 20,
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    // )
                                  ],
                                ));
                          })),
                  SizedBox(height: 10),
                ]),
          )),
    );
  }

  Future<Position> _getLocation() async {
    var currentLocation;

    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  getAddress(double lat, double long) async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(lat, long);
      Placemark place = p[0];
      userAddress = place;
      print("future :" + place.subAdministrativeArea);
    } catch (e) {
      userAddress = null;
    }
  }

  getPrayerTimes(double lat, double long) {
    PrayerTime prayers = new PrayerTime();

    prayers.setTimeFormat(prayers.getTime12());
    prayers.setCalcMethod(prayers.getMWL());
    prayers.setAsrJuristic(prayers.getShafii());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [-6, 0, 3, 2, 0, 3, 6];

    String tmx = "${DateTime.now().timeZoneOffset}";

    var currentTime = DateTime.now();
    var timeZone = double.parse(tmx[0]);

    prayers.tune(offsets);

    setState(() {
      _prayerTimes = prayers.getPrayerTimes(currentTime, lat, long, timeZone);
      _prayerNames = prayers.getTimeNames();
    });
  }

  void setSP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setDouble('key_lat', userLocation.latitude);
    pref.setDouble('key_long', userLocation.longitude);
    pref.setString('key_address',
        " ${userAddress.subAdministrativeArea}" "${userAddress.country} ");
  }

  Future<dynamic> getSP() async {
    List dataPref = [];
    SharedPreferences pref = await SharedPreferences.getInstance();

    lat_value = pref.getDouble('key_lat');
    long_value = pref.getDouble('key_long');
    address = pref.getString('key_address');

    dataPref.add(lat_value);
    dataPref.add(long_value);
    dataPref.add(address);

    return dataPref;
  }
}
