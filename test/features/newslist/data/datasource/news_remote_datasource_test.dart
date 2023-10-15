import 'package:news_app/features/newslist/data/datasource/news_remote_datasource.dart';
import 'package:news_app/shared/data/remote/network_service.dart';
import 'package:news_app/shared/domain/models/news_source.dart';
import 'package:news_app/shared/domain/models/response.dart';
import 'package:news_app/shared/exceptions/http_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/dummy_data.dart';
import '../../../../fixtures/news/dummy_news_list.dart';
import '../../../../fixtures/news/dummy_news_source_list.dart';

void main() async {
  late NetworkService mockNetworkService;
  late NewsDatasource newsDatasource;
  setUpAll(() {
    mockNetworkService = MockNetworkService();
    newsDatasource = NewsRemoteDatasource(mockNetworkService);
  });
  group(
    'News Remote Datasource Test\n',
    () {
      test(
          'should return PaginatedResponse on success and the data is in valid format',
          () async {
        // arrange
        when(() => mockNetworkService.get(any(),
            queryParameters: any(named: 'queryParameters'))).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            statusMessage: '',
            data: ktestNewsResponse,
          ).toRight,
        );

        // act
        final resp = await newsDatasource.fetchPaginatedNews(page: 1);

        // assert
        expect(resp.isRight(), true);
      });
      test(
          'should return PaginatedResponse on success and the data is not in valid format',
          () async {
        // arrange
        when(() => mockNetworkService.get(any(),
            queryParameters: any(named: 'queryParameters'))).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            statusMessage: '',
            data: {},
          ).toRight,
        );

        // act
        final resp = await newsDatasource.fetchPaginatedNews(page: 1);

        // assert
        expect(resp.isRight(), true);
      });
      test('should return AppException on success but the data is null',
          () async {
        // arrange
        when(() => mockNetworkService.get(any(),
            queryParameters: any(named: 'queryParameters'))).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            statusMessage: '',
            data: null,
          ).toRight,
        );

        // act
        final resp = await newsDatasource.fetchPaginatedNews(page: 1);

        // assert
        expect(resp.isLeft(), true);
      });
      test('should return AppException on failure', () async {
        // arrange
        when(() => mockNetworkService.get(any(),
            queryParameters: any(named: 'queryParameters'))).thenAnswer(
          (_) async => ktestAppException.toLeft,
        );

        // act
        final resp = await newsDatasource.fetchPaginatedNews(page: 1);

        // assert
        expect(resp.isLeft(), true);
      });
    },
  );

  group('NewsSource Remote Datasource Test\n', () {
    test('should return Source List on success and the data is in valid format',
        () async {
      // arrange
      when(() => mockNetworkService.get(any(),
          queryParameters: any(named: 'queryParameters'))).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          statusMessage: '',
          data: ktestNewsSourceResponse,
        ).toRight,
      );

      // act
      final resp = await newsDatasource.fetchNewsSources();

      // assert
      expect(resp.isRight(), true);
    });
    test(
        'should return Source List on success and the data is not in valid format',
        () async {
      // arrange
      when(() => mockNetworkService.get(any(),
          queryParameters: any(named: 'queryParameters'))).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          statusMessage: '',
          data: {},
        ).toRight,
      );

      // act
      final resp = await newsDatasource.fetchNewsSources();

      // assert
      expect(resp.isRight(), true);
    });
    test('should return AppException on success but the data is null',
        () async {
      // arrange
      when(() => mockNetworkService.get(any(),
          queryParameters: any(named: 'queryParameters'))).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          statusMessage: '',
          data: null,
        ).toRight,
      );

      // act
      final resp = await newsDatasource.fetchNewsSources();

      // assert
      expect(resp.isLeft(), true);
    });
    test('should return AppException on failure', () async {
      // arrange
      when(() => mockNetworkService.get(any(),
          queryParameters: any(named: 'queryParameters'))).thenAnswer(
        (_) async => ktestAppException.toLeft,
      );

      // act
      final resp = await newsDatasource.fetchNewsSources();

      // assert
      expect(resp.isLeft(), true);
    });
  });

  group('Query Params Tests', () {
    test('Test with non-empty selected sources list', () {
      // Arrange
      final selectedSources = kTestNewsSourceList;
      final sourceId = selectedSources[0].id;

      // Act
      final queryParams = (newsDatasource as NewsRemoteDatasource)
          .buildQueryParams(selectedSources);

      // Assert
      expect(queryParams, {'sources': '$sourceId,$sourceId,$sourceId'});
    });

    test('Test with empty selected sources list', () {
      // Arrange
      final selectedSources = <NewsSource>[];

      // Act
      final queryParams = (newsDatasource as NewsRemoteDatasource)
          .buildQueryParams(selectedSources);

      // Assert
      expect(queryParams, {'country': 'in'});
    });

    test('Test with null selected sources list', () {
      // Arrange
      final selectedSources = null;

      // Act
      final queryParams = (newsDatasource as NewsRemoteDatasource)
          .buildQueryParams(selectedSources);

      // Assert
      expect(queryParams, {'country': 'in'});
    });
  });
}

class MockNetworkService extends Mock implements NetworkService {}
