import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/shared/domain/models/news_source.dart';

void main() {
  group('NewsSource model test\n', () {
    test('should equal object', () {
      final obj1 = NewsSource('id', 'name');
      final obj2 = NewsSource('id', 'name');
      expect(obj1, equals(obj2));
    });

    test('should not equal object after copy', () {
      final obj1 = NewsSource('id', 'name');
      final obj2 = obj1.copy(isSelected: true);
      expect(obj1, isNot(obj2));
    });

    test('hashCode should return the correct value', () {
      // Arrange
      final obj1 = NewsSource('id', 'name', isSelected: true);
      final obj2 = NewsSource('id', 'name', isSelected: true);

      // Act
      final hashCode1 = obj1.hashCode;
      final hashCode2 = obj2.hashCode;

      // Assert
      expect(hashCode1,
          hashCode2); // Objects with the same values should have the same hash code
    });

    test('hashCode should be different for different values', () {
      // Arrange
      final obj1 = NewsSource('id1', 'name1', isSelected: true);
      final obj2 = NewsSource('id2', 'name2');

      // Act
      final hashCode1 = obj1.hashCode;
      final hashCode2 = obj2.hashCode;

      // Assert
      expect(
          hashCode1,
          isNot(equals(
              hashCode2))); // Objects with different values should have different hash codes
    });
  });
}
