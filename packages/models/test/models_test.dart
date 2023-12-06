import 'package:flutter_test/flutter_test.dart';
import 'package:models/project.dart';
import 'package:models/user.dart';

void main() {
  group('User test group', () {
    test('Create User DataClass from json', () {
      expect(
        User.fromJson(
          {
            'email': 'test@email.com',
            'name': 'Test',
          },
        ),
        User(email: 'test@email.com', name: 'Test'),
      );
    });
    test('Create User DataClass from json', () {
      expect(User(email: 'test@email.com', name: 'Test').toJson(), {
        'email': 'test@email.com',
        'name': 'Test',
      });
    });
  });

  group('Project test group', () {
    test(
      'Create Project DataClass from json',
      () => expect(
        Project.fromJson(
          {
            'id': 1,
            'name': 'Test',
            'description': 'Test',
            'url': 'Test',
            'image_url': 'Test',
            'language': 'Test',
          },
        ),
        Project(
          id: 1,
          name: 'Test',
          description: 'Test',
          url: 'Test',
          imageUrl: 'Test',
          language: 'Test',
        ),
      ),
    );
    test(
      'Create Project DataClass from json',
      () => expect(
          Project(
            id: 1,
            name: 'Test',
            description: 'Test',
            url: 'Test',
            imageUrl: 'Test',
            language: 'Test',
          ).toJson(),
          {
            'id': 1,
            'name': 'Test',
            'description': 'Test',
            'url': 'Test',
            'image_url': 'Test',
            'language': 'Test',
          }),
    );
  });
}
