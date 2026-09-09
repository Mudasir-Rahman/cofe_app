import 'package:cofe_app/features/profile/data/model/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfileModel', () {
    test('includes phone number when parsing and serializing profile data', () {
      final model = ProfileModel.fromJson({
        'id': 'user-1',
        'name': 'John Doe',
        'photo_url': 'https://cdn.example.com/avatar.png',
        'phone_number': '+1234567890',
        'created_at': '2026-09-08T12:00:00.000Z',
      });

      expect(model.phoneNumber, '+1234567890');
      expect(model.toJson()['phone_number'], '+1234567890');
    });
  });
}
