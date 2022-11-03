import 'dart:async';

import 'package:ayush_hospitals/connections/hos.dart';
import 'package:ayush_hospitals/widgets/controlButtons.dart';
import 'package:ayush_hospitals/widgets/dropDownButtons.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ayush_hospitals/modules/map/tomtom_routing_engine.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final Completer<GoogleMapController> _controller = Completer();
  late final GoogleMapController googleMapController;
  LocationData? _locationData;
  List<LatLng> polylineCoordinates = [];
  bool dirController = false;
  Set<Marker> markers = {};
  LatLng? dirControllerLatLng;
  bool dirIsPressed = false;

  BitmapDescriptor sourceMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationMarker = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    setCustomMarkes();
    currLocation();
    super.initState();
  }

  void getPolyPoints(LatLng source, LatLng destination) {
    tomtom_api.getRouteBetweenCoordinates(source, destination).then((value) {
      polylineCoordinates = value;
      setState(() {});
    });
  }

// To get the current Location and listen location changes
  void currLocation() async {
    Location location = Location();

// Collecting Location Data

    _locationData = await location.getLocation();

    _controller.future.then((value) {
      googleMapController = value;
      setCustomMarkes();

      location.onLocationChanged.listen((newloc) {
        _locationData = newloc;
        if (dirIsPressed) {
          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
            zoom: 16,
            tilt: 60,
          )));
          getPolyPoints(
              LatLng(_locationData!.latitude!, _locationData!.longitude!),
              dirControllerLatLng!);
        } else {
          polylineCoordinates = [];
        }

        if (markers.isEmpty) {
          getMarker(_locationData!, markers);
        }

        markers.removeWhere((element) =>
            element.markerId == const MarkerId("current location"));
        markers.add(Marker(
          infoWindow: InfoWindow(
              title: "Me", snippet: "current location", onTap: () {}),
          icon: sourceMarker,
          markerId: const MarkerId("current location"),
          position: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        ));

        setState(() {});
      });
    });
    setState(() {});
  }

  void setCustomMarkes() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "lib/assets/images/hospital2.png")
        .then((icon) {
      destinationMarker = icon;
    });

    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "lib/assets/images/currLoc2.png")
        .then((icon) {
      sourceMarker = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _locationData == null
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple,
                color: Colors.green,
              ),
            )
          : GoogleMap(
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              markers: markers,
              // getMarker(_locationData!),
              initialCameraPosition: _currCameraPosition(),
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              polylines: {
                  Polyline(
                      polylineId: const PolylineId("default1"),
                      color: Colors.purple,
                      points: polylineCoordinates,
                      width: 6,
                      startCap: Cap.roundCap,
                      jointType: JointType.round,
                      endCap: Cap.roundCap)
                }),
      if (dirController)
        DirControlButtons(
          markerSet: markers,
          locationData: _locationData,
          dirControllerLatLng: dirControllerLatLng,
          polylineChange: (value) {
            polylineCoordinates = value;
            setState(() {});
          },
          controllerToggle: (value) {
            dirController = value;
            polylineCoordinates = [];
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: dirControllerLatLng!, zoom: 10)));
          },
          markerChange: (value) {
            markers = value;
            markers.add(Marker(
              infoWindow: InfoWindow(
                  title: "Me", snippet: "current location", onTap: () {}),
              icon: sourceMarker,
              markerId: const MarkerId("current location"),
              position:
                  LatLng(_locationData!.latitude!, _locationData!.longitude!),
            ));
            setState(() {});
          },
          onDirctionButtonPressed: (value) {
            dirIsPressed = value;
            if (!dirIsPressed) polylineCoordinates = [];
            setState(() {});
          },
        ),
      DropDownButtons(
        sortedMarkerSet: (value) {},
      ),
    ]);
  }

// Current Camera Postion
  CameraPosition _currCameraPosition() {
    return CameraPosition(
        target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        zoom: 14);
  }

  Set<Marker> getMarker(LocationData locationData, Set<Marker> m) {
    if (markers.isNotEmpty) {
      return m;
    } else {
      initiaMarkersSet(HosList.getLatLngList(), locationData);
      return markers;
    }
  }

  void initiaMarkersSet(List<LatLng> listLatLng, LocationData locationData) {
    for (LatLng latLng in listLatLng) {
      markers.add(Marker(
          infoWindow: InfoWindow(
              title: '"hospital name"',
              snippet: "click to details",
              onTap: () {}),
          icon: destinationMarker,
          markerId: MarkerId("HospitalId+$latLng"),
          position: latLng,
          onTap: (() {
            if (dirControllerLatLng == null) {
              dirController = dirController ? false : true;
            } else if (!dirController &&
                (dirControllerLatLng != latLng ||
                    dirControllerLatLng == latLng)) {
              dirController = dirController ? false : true;
            }
            dirControllerLatLng = latLng;
            if (!dirController) polylineCoordinates = [];
            setState(() {});
          })));
    }
    markers.add(Marker(
      infoWindow:
          InfoWindow(title: "Me", snippet: "current location", onTap: () {}),
      icon: sourceMarker,
      markerId: const MarkerId("current location"),
      position: LatLng(locationData.latitude!, locationData.longitude!),
    ));
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  Future<void> _disposeController() async {
    final GoogleMapController controller = await _controller.future;
    controller.dispose();
  }
}
