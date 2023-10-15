import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_source_notifier.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_source_state.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import '../../../../fixtures/dummy_data.dart';
import '../../../../fixtures/news/dummy_news_source_list.dart';
import 'news_provider_test.dart';

void main() {
  late NewsRepository newsRepository;
  late NewsSourceNotifier notifier;
  setUpAll(() {
    newsRepository = MockNewsRepository();
    notifier = NewsSourceNotifier(newsRepository);
  });

  stateNotifierTest<NewsSourceNotifier, NewsSourceState>(
    'Should fail when error occurs on fetch',
    build: () => NewsSourceNotifier(newsRepository),
    setUp: () {
      when(() => newsRepository.getNewsSources()).thenAnswer(
        (invocation) async => Left(ktestAppException),
      );
    },
    actions: (notifier) async {
      await notifier.fetchNewsSources();
    },
    expect: () => [
      const NewsSourceState(
        state: NewsSourceConcreteState.loading,
      ),
      const NewsSourceState(
        state: NewsSourceConcreteState.failure,
        sourceList: [],
      ),
    ],
  );

  stateNotifierTest<NewsSourceNotifier, NewsSourceState>(
    'Should load list of news on successful fetch',
    build: () => NewsSourceNotifier(newsRepository),
    setUp: () {
      when(() => newsRepository.getNewsSources()).thenAnswer(
        (invocation) async => Right(kTestNewsSourceList),
      );
    },
    actions: (notifier) async {
      await notifier.fetchNewsSources();
    },
    expect: () => [
      const NewsSourceState(
        state: NewsSourceConcreteState.loading,
      ),
      NewsSourceState(
        state: NewsSourceConcreteState.loaded,
        sourceList: kTestNewsSourceList,
      ),
    ],
  );

  stateNotifierTest<NewsSourceNotifier, NewsSourceState>(
    'Should update the selection',
    build: () => NewsSourceNotifier(newsRepository),
    setUp: () {
      when(() => newsRepository.getNewsSources()).thenAnswer(
        (invocation) async => Right(kTestNewsSourceList),
      );
    },
    actions: (notifier) async {
      await notifier.fetchNewsSources();
      notifier.updateSourceSelection(kTestNewsSourceList[0], true);
    },
    expect: () => [
      const NewsSourceState(
        state: NewsSourceConcreteState.loading,
      ),
      NewsSourceState(
        state: NewsSourceConcreteState.loaded,
        sourceList: kTestNewsSourceList,
      ),
      NewsSourceState(
        state: NewsSourceConcreteState.loaded,
        sourceList:
            kTestNewsSourceList.map((e) => e.copy(isSelected: true)).toList(),
      )
    ],
  );
}
