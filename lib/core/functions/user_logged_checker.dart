import 'package:bloc_statemanagement/core/api/api_key.dart';
import 'package:bloc_statemanagement/core/helper/cache/cache_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void userLoggedChecker(BuildContext context) {
  bool islogged = CacheHelper().getData(key: ApiKeys.isLogged) != null;
  bool isVisitedOnBoarding =
      CacheHelper().getData(key: ApiKeys.isVisitedOnBoarding) != null;
  if (islogged) {
    if (kDebugMode) {
      // customPushReplacement(context, const RootView());
    }
  } else if (isVisitedOnBoarding) {
    if (kDebugMode) {
      // customPushReplacement(context, const AuthView());
    }
  } else {
    if (kDebugMode) {
      // customPushReplacement(context, const OnboardingScreen());
    }
  }
}
