import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/core/utils/address_builder.dart';

/// Service for handling location-related operations
class LocationService {
  /// Get current position with address
  /// Returns a tuple of (Position, String address)
  Future<(Position, String)> getCurrentLocationWithAddress() async {
    try {
      // Check if location services are enabled
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw const LocationFailure(
            'Layanan lokasi tidak aktif. Silakan aktifkan di pengaturan.');
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw const LocationFailure('Izin lokasi ditolak.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw const LocationFailure(
            'Izin lokasi ditolak permanen. Silakan aktifkan di pengaturan aplikasi.');
      }

      // Get current position
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get address from coordinates (reverse geocoding)
      String address = '';
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          address = AddressBuilder.buildAddressString(placemarks[0]);
        }
      } catch (e) {
        // If reverse geocoding fails, we still return the position
        // Address will be empty string
      }

      return (position, address);
    } on LocationFailure {
      rethrow;
    } catch (e) {
      throw LocationFailure('Gagal mendapatkan lokasi: ${e.toString()}');
    }
  }

  /// Get current position only
  Future<Position> getCurrentPosition() async {
    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw const LocationFailure(
            'Layanan lokasi tidak aktif. Silakan aktifkan di pengaturan.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw const LocationFailure('Izin lokasi ditolak.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw const LocationFailure(
            'Izin lokasi ditolak permanen. Silakan aktifkan di pengaturan aplikasi.');
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } on LocationFailure {
      rethrow;
    } catch (e) {
      throw LocationFailure('Gagal mendapatkan lokasi: ${e.toString()}');
    }
  }
}
