import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Markers {
  BitmapDescriptor sourceMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationMarker = BitmapDescriptor.defaultMarker;

  Set<Marker> markersSet(List<LatLng> listLatLng, LocationData _locationData) {
    Set<Marker> markers = {};
    for (LatLng latLng in listLatLng) {
      markers.add(Marker(
          icon: destinationMarker,
          markerId: MarkerId("HospitalId+$latLng"),
          position: latLng,
          onTap: (() {})));
    }
    return markers;
  }

  Set<Marker> getMarkers(LatLng source, LatLng destination) {
    Marker sourceM = Marker(
        icon: sourceMarker,
        markerId: const MarkerId("default1"),
        position: source);
    Marker desM = Marker(
        icon: destinationMarker,
        markerId: const MarkerId("default2"),
        position: destination);

    return {sourceM, desM};
  }
}