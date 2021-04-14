import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:muslim_apps/baseurl/base_app.dart';
import 'package:muslim_apps/baseurl/base_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogProfil extends StatelessWidget {
  const DialogProfil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(BaseAsset.ppProfil),
                            fit: BoxFit.cover),
                      ),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: Size.size4, sigmaY: Size.size4),
                          child: Container(
                              color: Colors.grey.withOpacity(0.3),
                              child: Center(
                                  child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(BaseAsset.ppProfil),
                                      fit: BoxFit.cover),
                                ),
                              ))),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: Size.size8, horizontal: Size.size16),
                      child: Center(
                        child: Text(
                          Profil.nama,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Size.size16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: Size.size16,
                          right: Size.size16,
                          bottom: Size.size16),
                      child: Text(
                        Profil.desc,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: Size.size14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _itemSosmed(BaseAsset.instagram, Profil.instagram,
                        Profil.urlInstagram),
                    _itemSosmed(BaseAsset.whatsapp, Profil.whatsapp,
                        Profil.urlWhatsapp),
                    _itemSosmed(BaseAsset.facebook, Profil.facebook,
                        Profil.urlFacebook),
                    _itemSosmed(
                        BaseAsset.github, Profil.github, Profil.urlGithub),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: Size.size12, horizontal: Size.size16),
                      width: double.infinity,
                      child: FlatButton(
                        color: Colors.red,
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true).pop(),
                        child: Text('Tutup',
                            style: TextStyle(
                              fontSize: Size.size16,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  _itemSosmed(var icon, var sosmed, var url) {
    return InkWell(
      onTap: () => launch(url),
      child: Container(
          margin: EdgeInsets.symmetric(
              vertical: Size.size12, horizontal: Size.size16),
          child: Row(
            children: [
              Container(
                width: Size.size16,
                height: Size.size16,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(icon))),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Size.size12),
                child: Text(
                  sosmed,
                  style: TextStyle(fontSize: Size.size14, color: Colors.black),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: Size.size12,
              )
            ],
          )),
    );
  }
}
