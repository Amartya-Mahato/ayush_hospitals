import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:ayush_hospitals/modules/map/tomtom_routing_engine.dart';

class DirControlButtons extends StatefulWidget {
  LocationData? locationData;
  Set<Marker> markerSet;
  LatLng? dirControllerLatLng;
  final ValueChanged<bool> controllerToggle;
  final ValueChanged<List<LatLng>> polylineChange;
  final ValueChanged<Set<Marker>> markerChange;
  final ValueChanged<bool> onDirctionButtonPressed;

  DirControlButtons({
    Key? key,
    this.locationData,
    this.dirControllerLatLng,
    required this.markerSet,
    required this.controllerToggle,
    required this.polylineChange,
    required this.markerChange,
    required this.onDirctionButtonPressed,
  }) : super(key: key);

  @override
  State<DirControlButtons> createState() => _DirControlButtonsState();
}

class _DirControlButtonsState extends State<DirControlButtons> {
  bool dirLoding = false;
  List<LatLng> polylineCoordinates = [];
  Set<Marker> saveMarkerSet = {};
  bool pressedOneTime = false;

  void getPolyPoints(LatLng source, LatLng destination) {
    dirLoding = true;
    tomtom_api.getRouteBetweenCoordinates(source, destination).then((value) {
      polylineCoordinates = value;
      widget.polylineChange(polylineCoordinates);
      dirLoding = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 100,
          width: 50,
          child: SizedBox.expand(
              child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: ElevatedButton(
                  autofocus: true,
                  onPressed: () {
                    if (!pressedOneTime) {
                      pressedOneTime = true;
                      widget.onDirctionButtonPressed(pressedOneTime);

                      removeExtraMarkers(
                          widget.markerSet,
                          widget.dirControllerLatLng!,
                          LatLng(widget.locationData!.latitude!,
                              widget.locationData!.longitude!));

                      getPolyPoints(
                          LatLng(widget.locationData!.latitude!,
                              widget.locationData!.longitude!),
                          widget.dirControllerLatLng!);
                      widget.polylineChange(polylineCoordinates);
                      setState(() {});
                    }
                  },
                  style: elevatedButtonStyle(true),
                  child: dirLoding
                      ? const SizedBox(
                          height: 19,
                          width: 19,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Icon(
                          Icons.directions,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: ElevatedButton(
                  autofocus: true,
                  onPressed: () {
                    widget.onDirctionButtonPressed(false);
                    widget.controllerToggle(false);
                    polylineCoordinates = [];
                    widget.polylineChange([]);
                    if (pressedOneTime) reviveExtraMarkers();
                    pressedOneTime = false;
                    setState(() {});
                  },
                  style: elevatedButtonStyle(false),
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
        ));
  }

  ButtonStyle elevatedButtonStyle(bool isDirButton) {
    return ElevatedButton.styleFrom(
        shape: isDirButton
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6)))
            : const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(6))),
        backgroundColor: Colors.black,
        alignment: Alignment.center);
  }

  void removeExtraMarkers(
      Set<Marker> markers, LatLng selectedMarker, LatLng currLocMarker) {
    Set<Marker> resMarker = {};
    for (Marker marker in markers) {
      if (marker.position == selectedMarker) {
        resMarker = {marker};
        break;
      }
    }

    for (Marker marker in markers) {
      if (marker.markerId == const MarkerId("current location")) {
        resMarker.add(marker);
        break;
      }
    }

    saveMarkerSet = markers;
    widget.markerChange(resMarker);
  }

  void reviveExtraMarkers() {
    polylineCoordinates = [];
    saveMarkerSet.removeWhere(
        (element) => element.markerId == const MarkerId("current location"));
    widget.markerChange(saveMarkerSet);
  }
}
