import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/user_model.dart';
import '../models/case_model.dart';
import '../models/notification_model.dart';

class ApiService {
  static String? _token;

  static void setToken(String? token) {
    _token = token;
  }

  static Map<String, String> _getHeaders() {
    final headers = {'Content-Type': 'application/json'};
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  static Future<User> register(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      final user = User.fromJson(jsonDecode(response.body));
      _token = user.token;
      return user;
    } else {
      throw Exception(
        jsonDecode(response.body)['message'] ?? 'Registration failed',
      );
    }
  }

  static Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      _token = user.token;
      return user;
    } else {
      throw Exception(jsonDecode(response.body)['message'] ?? 'Login failed');
    }
  }

  static Future<User> getMe() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/auth/me'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user data');
    }
  }

  static Future<CaseModel> createCase(Map<String, dynamic> caseData) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/cases'),
      headers: _getHeaders(),
      body: jsonEncode(caseData),
    );

    if (response.statusCode == 201) {
      return CaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        jsonDecode(response.body)['message'] ?? 'Failed to create case',
      );
    }
  }

  static Future<CaseModel> uploadVideo(String caseId, File videoFile) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppConstants.baseUrl}/cases/$caseId/video'),
    );

    request.headers['Authorization'] = 'Bearer $_token';
    request.files.add(
      await http.MultipartFile.fromPath('video', videoFile.path),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return CaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        jsonDecode(response.body)['message'] ?? 'Failed to upload video',
      );
    }
  }

  static Future<List<CaseModel>> getMyCases() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/cases/my-cases'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CaseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get cases');
    }
  }

  static Future<List<CaseModel>> getDoctorCases() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/cases/doctor-cases'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CaseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get cases');
    }
  }

  static Future<CaseModel> getCaseById(String caseId) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/cases/$caseId'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      return CaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get case details');
    }
  }

  static Future<CaseModel> submitDiagnosis(
    String caseId,
    String summary,
    String advice,
    String recommendation,
  ) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/cases/$caseId/diagnosis'),
      headers: _getHeaders(),
      body: jsonEncode({
        'summary': summary,
        'advice': advice,
        'recommendation': recommendation,
      }),
    );

    if (response.statusCode == 200) {
      return CaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to submit diagnosis');
    }
  }

  static Future<CaseModel> requestAdditionalTest(
    String caseId,
    String testType,
    String instructions,
  ) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/cases/$caseId/request-test'),
      headers: _getHeaders(),
      body: jsonEncode({'testType': testType, 'instructions': instructions}),
    );

    if (response.statusCode == 200) {
      return CaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to request additional test');
    }
  }

  static Future<CaseModel> submitTestResponse(
    String caseId,
    List<ScreeningAnswer> answers,
    File? videoFile,
  ) async {
    final request = http.MultipartRequest(
      'PUT',
      Uri.parse('${AppConstants.baseUrl}/cases/$caseId/test-response'),
    );

    request.headers['Authorization'] = 'Bearer $_token';
    request.fields['answers'] = jsonEncode(
      answers.map((a) => a.toJson()).toList(),
    );

    if (videoFile != null) {
      request.files.add(
        await http.MultipartFile.fromPath('video', videoFile.path),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return CaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to submit test response');
    }
  }

  static Future<List<NotificationModel>> getNotifications(
    bool unreadOnly,
  ) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/notifications?unreadOnly=$unreadOnly'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get notifications');
    }
  }

  static Future<int> getUnreadNotificationCount() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/notifications/unread-count'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['count'] ?? 0;
    } else {
      throw Exception('Failed to get unread count');
    }
  }

  static Future<NotificationModel> markNotificationAsRead(
    String notificationId,
  ) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/notifications/$notificationId/read'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to mark notification as read');
    }
  }

  static Future<void> markAllNotificationsAsRead() async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/notifications/read-all'),
      headers: _getHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to mark all notifications as read');
    }
  }

  static Future<Map<String, dynamic>> getReportUrl(String caseId) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/reports/$caseId/url'),
      headers: _getHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get report URL');
    }
  }

  static Future<CaseModel> updateCase(
    String caseId,
    Map<String, dynamic> caseData,
  ) async {
    final response = await http.put(
      Uri.parse('${AppConstants.baseUrl}/cases/$caseId'),
      headers: _getHeaders(),
      body: jsonEncode(caseData),
    );

    if (response.statusCode == 200) {
      return CaseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        jsonDecode(response.body)['message'] ?? 'Failed to update case',
      );
    }
  }

  static Future<void> deleteCase(String caseId) async {
    final response = await http.delete(
      Uri.parse('${AppConstants.baseUrl}/cases/$caseId'),
      headers: _getHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception(
        jsonDecode(response.body)['message'] ?? 'Failed to delete case',
      );
    }
  }
}
