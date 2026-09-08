import 'package:cofe_app/features/auth/data/model/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    test('includes phone number when parsing and serializing profile data', () {
      final model = UserModel.fromJson({
        'id': 'user-1',
        'name': 'John Doe',
        'photo_url': 'https://cdn.example.com/avatar.png',
        'phone_number': '+1234567890',
        'created_at': '2026-09-08T12:00:00.000Z',
      }, email: 'john@example.com');

      expect(model.phoneNumber, '+1234567890');
      expect(model.toJson()['phone_number'], '+1234567890');
    });
  });
}
