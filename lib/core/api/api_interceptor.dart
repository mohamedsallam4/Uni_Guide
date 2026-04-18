import 'dart:developer';

import 'package:bloc_statemanagement/core/api/api_key.dart';
import 'package:bloc_statemanagement/core/helper/cache/cache_helper.dart';
import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getData(key: ApiKeys.token);

    if (token != null && token.isNotEmpty && token != 'guest') {
      options.headers['Authorization'] = 'Bearer $token';
      log('✓ Authorization header added: Bearer ${token.substring(0, 20)}...');
    } else {
      log('⚠ No valid token found');
    }

    handler.next(options);
  }
}
