import 'package:ayush_hospitals/pages/about_us.dart';
import 'package:ayush_hospitals/pages/donation.dart';
import 'package:ayush_hospitals/pages/faqs.dart';
import 'package:ayush_hospitals/pages/my_map.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> route = {
    'Find Hospital' : (context) => const MyMap(),
    'FAQs' : (context) => const Faqs(),
    'About Us' : (context) => const AboutUs(),
    'Donation' : (context) => const Donation(),
  };
}