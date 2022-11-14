import 'dart:async';
import 'dart:io';

import 'package:ayush_hospitals/modules/sortedMarkers/sortedMarkers.dart';
import 'package:ayush_hospitals/widgets/controlButtons.dart';
import 'package:ayush_hospitals/widgets/topExpandButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ayush_hospitals/modules/map/tomtom_routing_engine.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});
  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
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
    
    webViewInit();
    setCustomMarkes();
    currLocation();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void getPolyPoints(LatLng source, LatLng destination) {
    tomtom_api.getRouteBetweenCoordinates(source, destination).then((value) {
      polylineCoordinates = value;
      setState(() {});
    });
  }

  void webViewInit() async {
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(false);
    }
    AndroidInAppWebViewController.getSafeBrowsingPrivacyPolicyUrl();
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
            tilt: 50,
          )));
          getPolyPoints(
              LatLng(_locationData!.latitude!, _locationData!.longitude!),
              dirControllerLatLng!);
        } else {
          polylineCoordinates = [];
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayushman Hospitals",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            )),
        elevation: 1,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: Stack(children: [
        _locationData == null
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.black,
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
          
        TopExpandButtons(sortedMarkerSet: (value) {
          getMarker(value);
          setState(() {});
        })
      ]),
    );
  }

// Current Camera Postion
  CameraPosition _currCameraPosition() {
    return CameraPosition(
        target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        zoom: 14);
  }

  void getMarker(List<String> stringList) async {
    List<List<dynamic>> sortedData = [];
    sortedData = await SortedMarkers.getSortedMarkers(
        stringList[0], stringList[1], stringList[2]);

    if (sortedData.isNotEmpty) {
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: sortedData[0][0],
        zoom: 9,
      )));
    }
    markers = markersSet(sortedData);
    setState(() {});
  }

  Set<Marker> markersSet(List<List<dynamic>> sortedData) {
    Set<Marker> res = {};
    for (List<dynamic> sorted in sortedData) {
      LatLng sortedLatLng = sorted[0];
      String title = sorted[2];
      String hosid = sorted[1];

      res.add(Marker(
          infoWindow: InfoWindow(
              title: title,
              snippet: "click to see details",
              onTap: () async {
                await browser.open(
                    options: ChromeSafariBrowserClassOptions(
                        ios: IOSSafariOptions(barCollapsingEnabled: true),
                        android: AndroidChromeCustomTabsOptions(
                            shareState: CustomTabsShareState.SHARE_STATE_OFF)),
                    url: Uri.parse(
                        'https://hospitals.pmjay.gov.in/Search/empnlWorkFlow.htm?actionFlag=ViewIndividualHosptlDtls&search=Y&applSearch=&hospInfoId=$hosid&appReadOnly=Y&draftMenu=&isRSBY=&invalidMenu='));
                setState(() {});
                await browser.close();
              }),
          icon: destinationMarker,
          markerId: MarkerId("$sorted[1]"),
          position: sortedLatLng,
          onTap: (() {
            if (dirControllerLatLng == null) {
              dirController = dirController ? false : true;
            } else if (!dirController &&
                (dirControllerLatLng != sortedLatLng ||
                    dirControllerLatLng == sortedLatLng)) {
              dirController = dirController ? false : true;
            }
            dirControllerLatLng = sortedLatLng;
            if (!dirController) polylineCoordinates = [];
            setState(() {});
          })));
    }
    return res;
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }

  Future<void> disposeController() async {
    googleMapController = await _controller.future;
    googleMapController.dispose();
  }
}
