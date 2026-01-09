import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

/// Widget untuk memilih lokasi menggunakan Google Maps
class LocationPickerMap extends StatefulWidget {
  final Position? initialPosition;
  final Function(double latitude, double longitude) onLocationChanged;
  final double height;

  const LocationPickerMap({
    super.key,
    this.initialPosition,
    required this.onLocationChanged,
    this.height = 150,
  });

  @override
  State<LocationPickerMap> createState() => _LocationPickerMapState();
}

class _LocationPickerMapState extends State<LocationPickerMap> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // Set initial location
    if (widget.initialPosition != null) {
      _selectedLocation = LatLng(
        widget.initialPosition!.latitude,
        widget.initialPosition!.longitude,
      );
    } else {
      // Default to Jakarta if no initial position
      _selectedLocation = const LatLng(-6.2088, 106.8456);
    }
    _updateMarker(_selectedLocation!);
  }

  void _updateMarker(LatLng position) {
    setState(() {
      _selectedLocation = position;
      _markers = {
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
          draggable: true,
          onDragEnd: (LatLng newPosition) {
            _updateLocation(newPosition);
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      };
    });
  }

  void _updateLocation(LatLng position) {
    _updateMarker(position);
    widget.onLocationChanged(position.latitude, position.longitude);
  }

  void _onMapTap(LatLng position) {
    _updateLocation(position);
    
    // Move camera to tapped position
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(position),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    
    // Move camera to initial position
    if (_selectedLocation != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          _selectedLocation!,
          15.0,
        ),
      );
    }
  }


  @override
  void didUpdateWidget(LocationPickerMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update marker if initial position changes
    if (widget.initialPosition != null &&
        (oldWidget.initialPosition == null ||
            widget.initialPosition!.latitude != oldWidget.initialPosition!.latitude ||
            widget.initialPosition!.longitude != oldWidget.initialPosition!.longitude)) {
      final newLocation = LatLng(
        widget.initialPosition!.latitude,
        widget.initialPosition!.longitude,
      );
      _updateMarker(newLocation);
      
      // Move camera to new position
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(newLocation, 15.0),
      );
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _selectedLocation!,
            zoom: 15.0,
          ),
          markers: _markers,
          onTap: _onMapTap,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: true,
          mapToolbarEnabled: false,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: false,
          rotateGesturesEnabled: true,
          mapType: MapType.normal,
        ),
      ),
    );
  }
}
