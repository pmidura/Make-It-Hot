import 'package:flutter/material.dart';

class MyRoute extends MaterialPageRoute {
  MyRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}