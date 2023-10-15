//test for filename
import 'package:dartz/dartz.dart';
import 'package:news_app/features/newslist/data/datasource/news_remote_datasource.dart';
import 'package:news_app/features/newslist/data/repositories/news_repository.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/shared/data/remote/mapper/network_to_entity_mapper.dart';
import 'package:news_app/shared/data/remote/model/news_source.dart';
import 'package:news_app/shared/domain/models/paginated_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/dummy_data.dart';

void main() {
  late NewsDatasource newsDatasource;
  late NewsRepository newsRepository;
  setUpAll(() {
    newsDatasource = MockRemoteDatasource();
    newsRepository = NewsRepositoryImpl(newsDatasource);
  });

  group('News Repository Test\n', () {
    test('Should return PaginatedResponse on success', () async {
      // arrange
      when(() => newsDatasource.fetchPaginatedNews(page: any(named: 'page')))
          .thenAnswer(
        (_) async => Right(PaginatedResponse.fromJson({}, [])),
      );

      // assert
      final response = await newsRepository.getNewsList(page: 1);

      // act
      expect(response.isRight(), true);
    });

    test('Should return Source List on success', () async {
      // arrange
      when(() => newsDatasource.fetchNewsSources()).thenAnswer(
        (_) async =>
            Right(List.of([NewsSourceNetModel.fromJson({}).toEntity()])),
      );

      // assert
      final response = await newsRepository.getNewsSources();

      // act
      expect(response.isRight(), true);
    });

    test(
      'Should return AppException on failure',
      () async {
        // arrange
        when(() => newsDatasource.fetchPaginatedNews(page: any(named: 'page')))
            .thenAnswer(
          (_) async => Left(ktestAppException),
        );

        // assert
        final response = await newsRepository.getNewsList(page: 2);

        // act
        expect(response.isLeft(), true);
      },
    );

    test(
      'Should return AppException on failure',
      () async {
        // arrange
        when(() => newsDatasource.fetchNewsSources()).thenAnswer(
          (_) async => Left(ktestAppException),
        );

        // assert
        final response = await newsRepository.getNewsSources();

        // act
        expect(response.isLeft(), true);
      },
    );
  });
}

class MockRemoteDatasource extends Mock implements NewsRemoteDatasource {}
