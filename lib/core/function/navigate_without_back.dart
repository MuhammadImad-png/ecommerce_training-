import 'package:flutter/material.dart';

Future<dynamic> navigateTo(BuildContext context, Widget view) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => view));
}
