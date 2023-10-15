import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/shared/data/remote/model/news.dart';

import '../../../../fixtures/data/news_response.dart';
import '../../../../fixtures/news/dummy_news_list.dart';

void main() {
  group(
    'NewsModel Test\n',
    () {
      test('Should parse News from json', () {
        expect(NewsNetModel.fromJson(newsMap), ktestNewsNetList[0]);
      });

      test('Should return string of news', () {
        expect(ktestNewsNetList[0].toJson(), isA<Map<String, dynamic>>());
      });
    },
  );
}
