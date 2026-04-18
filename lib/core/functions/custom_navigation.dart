import 'package:flutter/material.dart';

void customPushAndRemoveUntil(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}

void customPush(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

void customPushReplacement(BuildContext context, Widget screen) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => screen));
}

void customPop(BuildContext context) {
  Navigator.of(context).pop();
}
