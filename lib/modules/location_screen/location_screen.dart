import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../layout/app_layout/app_layout.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 11.5,
  );
  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;

  @override
  void initState() {
    _origin = Marker(
      markerId: const MarkerId('mower'),
      infoWindow: const InfoWindow(title: 'Origin'),
      position: const LatLng(29.971229,31.288914),
    );
    // _destination = Marker(
    //   markerId: const MarkerId('location2'),
    //   position: const LatLng(30.8882, 31.2888),
    // );
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.00,
        //centerTitle: true,
        title: const Text(
          'Readings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4d4d4d),
          ),
        ),
        actions: [
          TextButton(
              onPressed: ()=>_googleMapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: _origin!.position,
                        zoom: 14.5,
                        tilt: 50.0,
                      ),
                  ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.lightGreen,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
              child: Text('mower')
          ),
          // TextButton(
          //     onPressed: ()=>_googleMapController!.animateCamera(
          //       CameraUpdate.newCameraPosition(
          //         CameraPosition(
          //           target: _destination!.position,
          //           zoom: 14.5,
          //           tilt: 50.0,
          //         ),
          //       ),
          //     ),
          //     style: TextButton.styleFrom(
          //       foregroundColor: Colors.lightBlue,
          //       textStyle: TextStyle(
          //           fontWeight: FontWeight.w600
          //       ),
          //     ),
          //     child: Text('destination')
          // ),
          // TextButton(onPressed: onPressed, child: child),

        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF063C14),
            size: 25,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppLayout()),
            );
          },
        ),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
          if (_origin != null) _origin!,
          if (_destination != null) _destination!,
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.center_focus_strong),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController!.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) {
    if (_origin == null || (_origin == null && _destination == null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });
    }
  }
}