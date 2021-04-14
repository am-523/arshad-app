import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:muslim_apps/api/api_url.dart';
import 'package:muslim_apps/api/api_util.dart';

class ApiService extends ApiUtil implements ApiUrl {
  static final ApiService _apiService = ApiService._singleTon();

  factory ApiService() => _apiService;

  ApiService._singleTon();

  messageError(String title, String message) {}

  @override
  Future<void> get(
      {String url,
      Map<String, String> headers,
      Function(bool status, String message, Map<String, dynamic> response)
          callback}) async {
    http.get(Uri.parse(url), headers: headers).then((value) {
      callback(value.statusCode == 200,
          value.statusCode == 200 ? "sukses" : "gagal", jsonDecode(value.body));
    }).catchError((error) {
      callback(false, error.toString(), null);
    }).timeout(Duration(seconds: 30), onTimeout: () {
      callback(false, "Timeout", null);
    });
  }

  @override
  Future<void> delete(
      {String url,
      Map<String, String> headers,
      Function(bool status, String message, Map<String, dynamic> response)
          callback}) async {
    http.delete(Uri.parse(url), headers: headers).then((res) {
      callback(res.statusCode == 200,
          res.statusCode == 200 ? "Sukses" : "Gagal", jsonDecode(res.body));
      debugPrint("print apa aja yang kamu butuhkan");
    }).catchError((err) {
      callback(false, err.toString(), null);
    }).timeout(Duration(seconds: 30), onTimeout: () {
      callback(false, "Timeout", null);
    });
  }

  @override
  Future<void> post(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      Function(bool status, String message, Map<String, dynamic> response)
          callback}) async {
    http.post(Uri.parse(url), headers: headers, body: body).then((res) {
      callback(res.statusCode == 200,
          res.statusCode == 200 ? "Sukses" : "Gagal", jsonDecode(res.body));
    }).catchError((err) {
      callback(false, err.toString(), null);
    }).timeout(Duration(seconds: 30), onTimeout: () {
      callback(false, "Timeout", null);
    });
  }

  @override
  Future<void> put(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      Function(bool status, String message, Map<String, dynamic> response)
          callback}) async {
    http.put(Uri.parse(url), headers: headers, body: body).then((res) {
      callback(res.statusCode == 200,
          res.statusCode == 200 ? "Sukses" : "Gagal", jsonDecode(res.body));
    }).catchError((err) {
      callback(false, err.toString(), null);
    }).timeout(Duration(seconds: 30), onTimeout: () {
      callback(false, "Timeout", null);
    });
  }
}
