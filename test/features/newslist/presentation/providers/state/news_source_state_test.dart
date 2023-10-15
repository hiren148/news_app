import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_source_state.dart';

void main() {
  group('NewsSourceState Test\n', () {
    test('Should update concrete state', () {
      NewsSourceState newsSourceState = const NewsSourceState();

      newsSourceState =
          newsSourceState.copyWith(message: 'NewsSourceConcreteState.loading');

      expect(
          newsSourceState.message, equals('NewsSourceConcreteState.loading'));
    });
  });
}
