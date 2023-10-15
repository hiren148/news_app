//test for filename
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_list_notifier.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_list_state.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import '../../../../fixtures/dummy_data.dart';
import '../../../../fixtures/news/dummy_news_list.dart';
import '../../../../fixtures/news/dummy_news_source_list.dart';

void main() {
  late NewsRepository newsRepository;
  late NewsNotifier notifier;
  setUpAll(() {
    newsRepository = MockNewsRepository();
    notifier = NewsNotifier(newsRepository);
  });
  stateNotifierTest<NewsNotifier, NewsState>(
    'Should fail when error occurs on fetch',
    build: () => NewsNotifier(newsRepository),
    setUp: () {
      when(() => newsRepository.getNewsList(page: 1)).thenAnswer(
        (invocation) async => Left(ktestAppException),
      );
    },
    actions: (notifier) async {
      await notifier.fetchNews();
    },
    expect: () => [
      const NewsState(
        state: NewsConcreteState.loading,
        page: 1,
        total: 0,
        hasData: false,
      ),
      const NewsState(
        state: NewsConcreteState.failure,
        newsList: [],
        page: 1,
        total: 0,
        hasData: false,
      ),
    ],
  );
  stateNotifierTest<NewsNotifier, NewsState>(
    'Should load list of news on successful fetch',
    build: () => NewsNotifier(newsRepository),
    setUp: () {
      when(() => newsRepository.getNewsList(page: 1)).thenAnswer(
        (invocation) async => Right(ktestPaginatedResponse()),
      );
    },
    actions: (notifier) async {
      await notifier.fetchNews();
    },
    expect: () => [
      const NewsState(
        state: NewsConcreteState.loading,
      ),
      NewsState(
        state: NewsConcreteState.loaded,
        hasData: true,
        newsList: kTestNewsList,
        page: 2,
        total: 100,
      ),
    ],
  );
  stateNotifierTest<NewsNotifier, NewsState>(
    'Should have news list of previous fetch when error occurs on second page',
    build: () => NewsNotifier(newsRepository),
    setUp: () {
      when(() => newsRepository.getNewsList(page: 1)).thenAnswer(
        (invocation) async => Right(ktestPaginatedResponse()),
      );
      when(() => newsRepository.getNewsList(page: 2)).thenAnswer(
        (invocation) async => Left(ktestAppException),
      );
    },
    actions: (notifier) async {
      await notifier.fetchNews();
      await notifier.fetchNews();
    },
    expect: () => [
      const NewsState(
        state: NewsConcreteState.loading,
      ),
      NewsState(
        state: NewsConcreteState.loaded,
        hasData: true,
        newsList: kTestNewsList,
        page: 2,
        total: 100,
      ),
      NewsState(
        state: NewsConcreteState.fetchingMore,
        hasData: true,
        newsList: kTestNewsList,
        page: 2,
        total: 100,
      ),
      NewsState(
        state: NewsConcreteState.failure,
        page: 2,
        total: 100,
        hasData: true,
        newsList: kTestNewsList,
      ),
    ],
  );

  stateNotifierTest<NewsNotifier, NewsState>(
    'Should increment page and append news response to the news list on successive fetch',
    build: () => NewsNotifier(newsRepository),
    setUp: () {
      when(() => newsRepository.getNewsList(page: 1)).thenAnswer(
        (invocation) async => Right(ktestPaginatedResponse()),
      );
      when(() => newsRepository.getNewsList(page: 2)).thenAnswer(
        (invocation) async => Right(ktestPaginatedResponse()),
      );
    },
    actions: (notifier) async {
      await notifier.fetchNews();
      await notifier.fetchNews();
    },
    expect: () => [
      const NewsState(
        state: NewsConcreteState.loading,
        page: 1,
        total: 0,
        hasData: false,
      ),
      NewsState(
        state: NewsConcreteState.loaded,
        newsList: kTestNewsList,
        page: 2,
        total: 100,
        hasData: true,
      ),
      NewsState(
        state: NewsConcreteState.fetchingMore,
        hasData: true,
        page: 2,
        total: 100,
        newsList: kTestNewsList,
      ),
      NewsState(
        state: NewsConcreteState.loaded,
        newsList: [...kTestNewsList, ...kTestNewsList],
        page: 3,
        total: 100,
        hasData: true,
      ),
    ],
  );

  group('When Source List for filter', () {
    test('should null if source list is null', () {
      final sources = notifier.getSelectedSources(null);
      expect(sources, isNull);
    });

    test('should empty if nothing is selected', (){
      final sources = notifier.getSelectedSources(kTestNewsSourceList);
      expect(sources, isNot(null));
      expect(sources!.length, 0);
    });

  });

  group('When the fetch is called while loading', () {
    stateNotifierTest<NewsNotifier, NewsState>(
      'Should not load list of news when it is already loading while fetch',
      build: () => NewsNotifier(newsRepository),
      setUp: () {
        when(() => newsRepository.getNewsList(page: 1)).thenAnswer(
          (invocation) async => Right(ktestPaginatedResponse()),
        );
      },
      actions: (notifier) async {
        notifier.fetchNews();
        notifier.fetchNews();
      },
      expect: () => [
        const NewsState(
          newsList: [],
          hasData: false,
          state: NewsConcreteState.loading,
        ),
        NewsState(
          newsList: kTestNewsList,
          total: 100,
          page: 2,
          hasData: true,
          state: NewsConcreteState.loaded,
        )
      ],
    );
  });

  test('Should reset state to initial', () {
    notifier.resetState();

    // ignore: invalid_use_of_protected_member
    expect(notifier.state, const NewsState.initial());
  });
}

class MockNewsRepository extends Mock implements NewsRepository {}
