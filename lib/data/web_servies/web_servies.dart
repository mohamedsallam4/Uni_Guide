// lib/data/web_services/university_web_services.dart

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class UniversityWebServices {
  final http.Client client;
  final Duration timeout;

  /// يسمح بتمرير http.Client (مفيد للاختبارات) و timeout اختياري
  UniversityWebServices({http.Client? client, Duration? timeout})
      : client = client ?? http.Client(),
        timeout = timeout ?? const Duration(seconds: 10);

  /// يرجع List<dynamic> (الـ JSON الخام كـ List of Maps)
  Future<List<dynamic>> getUniversitiesByCountry(String country) async {
    // ✅ استخدم Uri.https علشان نضمن الـ SSL + أطبع اللينك




final Uri uri = Uri.http(   // لاحظ http مش https
  'universities.hipolabs.com',
  '/search',
  {'country': country},
);

    try {
      // نرسل GET ونطبق timeout مع headers
      final http.Response response = await client.get(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "User-Agent": "FlutterApp",
        },
      ).timeout(timeout);

      print('📥 Raw Response: ${response.body}');

      // حالة الاستجابة الناجحة
      if (response.statusCode == 200) {
        final dynamic decoded = json.decode(response.body);

        // نتأكد إن الـ JSON عبارة عن قائمة
        if (decoded is List<dynamic>) {
          return decoded;
        } else {
          throw FormatException(
              'Expected JSON list but got ${decoded.runtimeType}');
        }
      } else {
        // HttpException: message مطلوب، uri يُرسل كـ named parameter
        throw HttpException(
          'Request failed with status: ${response.statusCode}',
          uri: uri,
        );
      }
    } on SocketException catch (e) {
      // مشكلة اتصال (لا إنترنت، DNS، firewall ...)
      throw Exception('No Internet connection: ${e.message}');
    } on TimeoutException {
      // إذا أخد وقت أطول من timeout المحدد
      throw Exception('Request timed out after ${timeout.inSeconds} seconds');
    } on FormatException catch (e) {
      // مشكلة في فورمات الرد (مش JSON كما انتظارنا)
      throw Exception('Bad response format: ${e.message}');
    } catch (e) {
      // أي خطأ غير متوقع - نرسله للطبقات اللي فوق
      throw Exception('Unexpected error: $e');
    }
  }
}
