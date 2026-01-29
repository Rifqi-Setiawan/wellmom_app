/// Validates profile photo for upload (format and size).
class ProfilePhotoValidator {
  static const int maxSizeBytes = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedExtensions = ['jpg', 'jpeg', 'png'];

  /// Returns null if valid, or error message if invalid.
  static String? validateFile(String path, int lengthBytes) {
    final ext = path.split('.').last.toLowerCase();
    if (!allowedExtensions.contains(ext)) {
      return 'Format file harus JPG, JPEG, atau PNG';
    }
    if (lengthBytes > maxSizeBytes) {
      return 'Ukuran file maksimal 5MB';
    }
    return null;
  }
}
