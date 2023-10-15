import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_list_state.dart';

void main() {
  group('NewsState Test\n', () {
    test('Should update concrete state', () {
      NewsState newsState = const NewsState();

      newsState =
          newsState.copyWith(message: 'NewsConcreteState.loading');

      expect(newsState.message, equals('NewsConcreteState.loading'));
    });
  });
}
