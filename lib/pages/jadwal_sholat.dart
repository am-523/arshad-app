import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_apps/pages/models/constant.dart';
import 'package:muslim_apps/pages/models/prayer_time.dart';
import 'package:muslim_apps/theme.dart';
import 'package:muslim_apps/widget/jadwal_item.dart';

class JadwalSholat extends StatefulWidget {
  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  Position userLocation;
  Placemark userAddress;

  List<String> gambar = [
    "assets/subuh.png",
    "assets/terbit.png",
    "assets/zhur.png",
    "assets/magrib.png",
    "assets/sunset.png",
    "assets/asr.png",
    "assets/isyah.png"
  ];

  List<String> _prayerTimes = [];
  List<String> _prayerNames = [];
  List initData = [];

  String address = "Jakarta, Indonesia";

  get geolocator => null;

  @override
  void initState() {
    super.initState();

    getPrayerTimes();
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
          onTap: () {/* Write listener code here */},
          child: Icon(Icons.arrow_back // add custom icons also
              ),
        ),
      ),
      body: SafeArea(
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
            children: [
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                label: Text(
                  address ?? 'Mencari Lokasi..',
                  style: whiteTextStyle,
                ),
              ),
              Container(
                //width: double.infinity,
                child: Image.asset(
                  'assets/logo.png',
                  width: 300,
                ),
              ),
              JadwalItem(
                icon: 'assets/subuh.png',
                title: 'Subuh',
                waktu: '04:52 PM',
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: whiteColor,
                child: ListView.builder(
                  itemCount: _prayerNames.length,
                  itemBuilder: (BuildContext context, position) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          JadwalItem(
                            icon: gambar[position],
                            title: _prayerNames[position],
                            waktu: _prayerTimes[position],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getPrayerTimes() {
    PrayerTime prayers = new PrayerTime();

    prayers.setTimeFormat(prayers.getTime12());
    prayers.setCalcMethod(prayers.getKarachi());
    prayers.setAsrJuristic(prayers.getHanafi());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ]; // {Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha}
    prayers.tune(offsets);

    var currentTime = DateTime.now();

    setState(() {
      _prayerTimes = prayers.getPrayerTimes(
          currentTime, Constants.lat, Constants.long, Constants.timeZone);
      _prayerNames = prayers.getTimeNames();
    });
  }
}
