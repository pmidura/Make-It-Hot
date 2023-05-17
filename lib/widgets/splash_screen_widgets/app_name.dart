import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text appName() => Text(
  "Make It Hot!",
  style: GoogleFonts.sacramento(
    fontSize: 34,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    letterSpacing: 1.5,
  ),
);
