/// Response from POST/PUT profile photo upload endpoints.
class UploadProfilePhotoResponse {
  final String filePath;
  final String fileUrl;
  final bool success;

  const UploadProfilePhotoResponse({
    required this.filePath,
    required this.fileUrl,
    required this.success,
  });

  factory UploadProfilePhotoResponse.fromJson(Map<String, dynamic> json) {
    return UploadProfilePhotoResponse(
      filePath: json['file_path'] as String? ?? '',
      fileUrl: json['file_url'] as String? ?? '',
      success: json['success'] == true,
    );
  }
}
