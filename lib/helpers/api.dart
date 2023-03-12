import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Map<String, dynamic>> get({
    required String url,
    String? token,
    String lang = 'en',
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',
      'lang':lang,
    });
    if (token != null) {
      headers.addAll({
        'Authorization':token,
      });
    }
    http.Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/$url'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a issue with the status code ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    required dynamic body,
    String? token,
    String lang = 'en',
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',
      'lang': lang,
    });

    if (token != null) {
      headers.addAll({
        'Authorization': token,
      });
    }

    http.Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/$url'),
      body: jsonEncode(body),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a issue with the status code ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    required dynamic body,
    String? token,
    String lang = 'en',
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',
      'lang': lang,
    });
    if (token != null) {
      headers.addAll({
        'Authorization': token,
      });
    }

    http.Response response = await http.put(
      Uri.parse('https://student.valuxapps.com/api/$url'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a issue with the status code ${response.statusCode} with body ${response.body} ');
    }
  }
}
