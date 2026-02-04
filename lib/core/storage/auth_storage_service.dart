import 'package:shared_preferences/shared_preferences.dart';

/// Service for storing and retrieving authentication tokens
class AuthStorageService {
  static const String _accessTokenKey = 'access_token';

  /// Save access token to storage (whitespace otomatis di-trim)
  static Future<void> saveAccessToken(String token) async {
    final trimmed = token.trim();
    if (trimmed.isEmpty) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_accessTokenKey, trimmed);
    } catch (e) {
      print('Error saving access token: $e');
      // If storage fails, we still continue - token is saved in provider
      // User will need to login again after app restart
      rethrow;
    }
  }

  /// Get access token from storage
  static Future<String?> getAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_accessTokenKey);
    } catch (e) {
      print('Error getting access token: $e');
      // Return null if storage is not available
      // This is fine - user will need to login again
      return null;
    }
  }

  /// Remove access token from storage (logout)
  static Future<void> clearAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_accessTokenKey);
    } catch (e) {
      print('Error clearing access token: $e');
      // Continue even if clearing fails
    }
  }
}
