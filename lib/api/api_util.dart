import 'package:flutter/cupertino.dart';

abstract class ApiUtil {
  Future<void> get(
      {String url,
      Map<String, String> headers,
      VoidCallback callback(
          bool status, String message, Map<String, dynamic> response)});

  Future<void> post(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      VoidCallback callback(
          bool status, String message, Map<String, dynamic> response)});

  Future<void> put(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      VoidCallback callback(
          bool status, String message, Map<String, dynamic> response)});

  Future<void> delete(
      {String url,
      Map<String, String> headers,
      VoidCallback callback(
          bool status, String message, Map<String, dynamic> response)});
}
