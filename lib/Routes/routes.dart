import 'package:ayush_hospitals/pages/about_nha.dart';
import 'package:ayush_hospitals/pages/donation.dart';
import 'package:ayush_hospitals/pages/faqs.dart';
import 'package:ayush_hospitals/pages/my_map.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> route = {
    'Find Hospital' : (context) => const MyMap(),
    'FAQs' : (context) => const Faqs(),
    'About NHA' : (context) => const AboutNHA(),
    'Donation' : (context) => const Donation(),
  };
}