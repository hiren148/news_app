import 'package:news_app/features/newslist/data/datasource/news_remote_datasource.dart';
import 'package:news_app/features/newslist/domain/providers/news_providers.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic networkService;
  late dynamic newsDataSource;
  late dynamic newsRepository;
  setUpAll(
    () {
      networkService = providerContainer.read(netwokServiceProvider);
      newsDataSource =
          providerContainer.read(newsDatasourceProvider(networkService));
      newsRepository =
          providerContainer.read(newsRepositoryProvider);
    },
  );
  test('newsDatasourceProvider is a NewsDatasource', () {
    expect(
      newsDataSource,
      isA<NewsDatasource>(),
    );
  });
  test('newsRepositoryProvider is a NewsRepository', () {
    expect(
      newsRepository,
      isA<NewsRepository>(),
    );
  });
  test('newsRepositoryProvider returns a NewsRepository', () {
    expect(
      providerContainer.read(newsRepositoryProvider),
      isA<NewsRepository>(),
    );
  });
}
