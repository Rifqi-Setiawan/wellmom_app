import 'package:shared_preferences/shared_preferences.dart';

class AuthStorageService {
  static const String _accessTokenKey = 'access_token';

  static Future<void> saveAccessToken(String token) async {
    final trimmed = token.trim();
    if (trimmed.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, trimmed);
  }

  static Future<String?> getAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_accessTokenKey);
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_accessTokenKey);
    } catch (_) {}
  }
}
