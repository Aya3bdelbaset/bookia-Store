import 'package:bookia/core/networking/api_endpoint.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/profile/data/model/profile_response.dart';
import 'package:flutter/material.dart';

class ProfileRepo {
  static Future<ProfileData?> getProfileData() async {
    try {
      final response = await DioFactory.dio!
          .get(ApiEndpoints.profile)
          .timeout(const Duration(seconds: 15));

      debugPrint('PROFILE STATUS: ${response.statusCode}');
      debugPrint('PROFILE RESPONSE: ${response.data}');

      if (response.statusCode == 200) {
        final profileResponse = ProfileResponseModel.fromJson(
          Map<String, dynamic>.from(response.data),
        );

        return profileResponse.data;
      }

      return null;
    } catch (e, stackTrace) {
      debugPrint('PROFILE API ERROR: $e');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }
}
