import 'package:flutter/material.dart';

BoxDecoration loginScreenDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffFBC5D8),
      Color.fromARGB(0, 243, 218, 153),
    ],
  ));
}
