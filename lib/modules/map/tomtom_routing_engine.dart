import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class tomtom_api {
  static Future<List<LatLng>> getRouteBetweenCoordinates(
      LatLng source, LatLng destination) async {
    List<LatLng> polylineCoordinates = [];

    final tomUrl = Uri.parse(
        'https://api.tomtom.com/routing/1/calculateRoute/${destination.latitude},${destination.longitude}:${source.latitude},${source.longitude}/json?key=krbs9pbiN2E4jTvdCWtJbsfNuDTutS8L');

    var req = http.Request('GET', tomUrl);
    req.headers.addAll({'Accept': '*/*', 'User-Agent': 'Ayush_hospital'});
    var res = await req.send();
    var resBody = await res.stream.bytesToString();
    var jsonData = await json.decode(resBody);

    var data = jsonData['routes'][0]['legs'][0]['points'];

    if (res.statusCode >= 200 && res.statusCode < 300) {
      for (dynamic latlng in data) {
        polylineCoordinates
            .add(LatLng(latlng['latitude'], latlng['longitude']));
      }
    } else {
       Exception("fatal error");
    }

    return polylineCoordinates;
  }
}
